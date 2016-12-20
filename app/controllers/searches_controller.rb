class SearchesController < ApplicationController
    def index
        if found = Room.find_by(title: params[:keyword]) || User.find_by(email: params[:keyword])
            redirect_to found
        end
    end
end