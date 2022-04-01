class ReviewsController < ApplicationController
    before_action :authenticate_user!
    before_action :find_book
    before_action :review_params, only: [:edit, :update, :destroy]

    def create
        @review = Review.new(params.require(:review).permit(:body))
        @review.book = @book;
        @review.user = current_user
        if @review.save
            redirect_to book_path(@book.id), status: 303
        else
            @reviews = @book.reviews
            render '/books/show', status: 303
        end
    end

    def edit
        @review = Review.find params[:id]
        if can?(:edit, @review)
            render :edit
        else
            redirect_to book_path(@book.id), status: 303
        end
    end

    def update 
        @review.update params.require(:review).permit(:body)
        book = @review.book_id 
        redirect_to book_path(@book.id), status: 303
    end
    
    def destroy
        @review = Review.find params[:id]
        if can?(:crud, @review)
            @review.destroy
            redirect_to book_path(@review.book)
        else
            redirect_to root_path, alert: "Not Authorized"
        end
    end


    private

    def find_book
        @book = Book.find params[:book_id]
    end

    def review_params 
        @review = Review.find params[:id]
    end
    
end
