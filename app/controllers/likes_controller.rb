class LikesController < ApplicationController


    def create
        review = Review.find params[:review_id]
        like = Like.new(review: review, user: current_user)
        if can?(:like, review)
            if like.save
                flash.notice = "review liked!"
            else
                flash.alert = like.errors.full_messages.join(', ')
            end
        else
            flash.alert = "You can not like this review"
        end
        redirect_to book_path(review.book)
    end

    def destroy
        like = Like.find params[:id]
        review = like.review
        if can?(:destroy, like)
            like.destroy
            flash.notice = "review Unliked!"
        else
            flash.alert = "Can't unlike it!"
        end
        redirect_to book_path(review.book)
    end


end
