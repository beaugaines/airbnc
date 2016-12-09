class ReviewsController < ApplicationController
    
    def index
        @reviews = Review.all
    end
    
    def show
        @reviews = Review.find[:rooms][:title]
    end
end
