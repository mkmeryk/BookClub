class ReviewsController < ApplicationController
    before_action :authenticate_user!
    before_action :find_book
    before_action :review_params, only: [:edit, :update, :destroy]

    def create
        @review = Review.new(params.require(:review).permit(:body, :approval))
        @review.book = @book;
        @review.user = current_user
        if @review.save
            if @review.approval == "Pending"
                @notification = Notification.create(user_id: current_user.id, review_id: @review.id )
            end
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
        @review.update params.require(:review).permit(:body, :approval)
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
