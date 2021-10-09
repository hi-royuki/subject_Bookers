class BooksController < ApplicationController


  def index
    @books = Book.all.order("id ASC")
    # ↑Book.all.order("id asc")で投稿順番指定/all省略可？？
    @book = Book.new
  end

  def create
    @books = Book.all
    @book = Book.new(book_params)
    
    #サクセスメッセージ
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book)
    else
      render :index
    end
  end

  def show
   @book = Book.find(params[:id])
  end

  def edit
   @book = Book.find(params[:id])
  end


  def update
    @book = Book.find(params[:id])
    
    #サクセスメッセージ
    if @book.update(book_params)
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(@book)
    else
      render :edit
    end
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end


  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
