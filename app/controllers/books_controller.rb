class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_param)
    if @book.save
      redirect_to @book
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path, status: :see_other
  end

  private
  def book_param
    params.require(:book).permit(:name,:author,:price,:year,:genre)
  end

end
