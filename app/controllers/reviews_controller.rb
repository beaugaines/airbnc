class ReviewsController < ApplicationController
    def create
        @room = Room.find(params[:room_id])
        review = @room.reviews.new(review_params)
        review.user = current_user
        if review.save
            flash[:notice] = "Your review have been saved"
            redirect_to @room
        else
            flash[:alert] = "There's an error, please try again"
            render @room
        end
    end
    
    def destroy
        @room = Room.find(params[:room_id])
        review = @room.reviews.find(params[:id])
        
        if review.destroy
            flash[:notice] = "Review have been deleted"
            redirect_to @room
        else
            flash[:alert] = "Comment couldn't be deleted. Try again."
            redirect_to @room
        end
    end
    
     private
    
    def review_params
        params.require(:review).permit(:body)
    end
    
end
