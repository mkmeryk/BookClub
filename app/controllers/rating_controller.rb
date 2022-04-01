class RatingController < ApplicationController
  before_action :authenticate_user!
  before_action :find_book
  before_action :rating_params, only: [:edit, :update, :destroy]  

  def create
    @rating = Rating.new(params.require(:rating).permit(:rate))
    @rating.book = @book;
    @rating.user = current_user
    if @rating.save
        redirect_to book_path(@book.id), status: 303
    else
        @ratings = @book.ratings
        render '/books/show', status: 303
    end
  end

  def edit
    @rating = Rating.find params[:id]
    if can?(:edit, @rating)
        render :edit
    else
        redirect_to book_path(@book.id), status: 303
    end
  end

  private

  def find_book
    @book = Book.find params[:book_id]
  end

  def rating_params 
    @rating = Rating.find params[:id]
  end
end
