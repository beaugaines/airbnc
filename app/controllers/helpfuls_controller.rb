class HelpfulsController < ApplicationController
   def create
        review = Review.find(params[:review_id])
        room = Room.find(review.room_id)
        helpful = current_user.helpfuls.build(review: review)
      
        if helpful.save
            flash[:notice] = "Saved."
        else
            flash[:alert] = "Something's wrong."
        end
        
        redirect_to room
   end
   
   def destroy
        review = Review.find(params[:review_id])
        room = Room.find(review.room_id)
        helpful = current_user.helpfuls.find_by(review_id: params[:review_id])
        if helpful.destroy
            flash[:notice] = "Saved."
        else
            flash[:alert] = "Something's wrong."
        end
        
        redirect_to room
   end
end