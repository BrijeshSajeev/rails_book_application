class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update ,:destroy]

  def index
    @books = Book.all
  end

  def show
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params.except(:author_name, :genre_names))
    author_name = book_params[:author_name]
    @book.author = Author.find_or_create_by(name: author_name)
    
    if @book.save
      genre_names = book_params[:genre_names].split(',').map(&:strip).uniq
      genre_names.each do |name|
        genre = Genre.find_or_create_by(name: name)
        @book.genres << genre unless @book.genres.include?(genre)
      end
      redirect_to @book
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def edit
  end

  def update
    author_name = book_params[:author_name]
    @book.author = Author.find_or_create_by(name: author_name)
  
    if @book.update(book_params.except(:author_name, :genre_names))
      genre_names = book_params[:genre_names].split(',').map(&:strip).uniq
      @book.genres = genre_names.map do |name|
        Genre.find_or_create_by(name: name)
      end
  
      redirect_to @book
    else
      render :edit, status: :unprocessable_entity
      # redirect_to root_path, alert: "Only authors can create articles."
    end
  end
  

  def destroy
    if(@book.author.name == current_user.name)
      @book.destroy
      redirect_to books_path, status: :see_other
    else
      redirect_to root_path, alert: "Only authors can delete articles."
    end
  end

  private
  def set_book
    @book = Book.find(params[:id])
  end
  
  def book_params
    params.require(:book).permit(:name, :author_name, :price, :year, :genre_names)
  end
end
