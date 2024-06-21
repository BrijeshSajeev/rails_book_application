class ReviewsController < ApplicationController
  before_action :set_book, only: [:create, :destroy]
  
  def create
    @review = @book.reviews.create(review_params)
    redirect_to book_path(@book)
  end

  def destroy
    @review = @book.reviews.find(params[:id])
    @review.destroy
    redirect_to book_path(@book), status: :see_other
  
  end
  private
  def set_book
    @book = Book.find(params[:book_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
