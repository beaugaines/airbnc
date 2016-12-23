class SearchesController < ApplicationController
    def index
        query_param = "%#{params[:keyword]}%"
        if found = Room.where('lower(title) LIKE ?', query_param).first || User.find_by(email: params[:keyword])
            redirect_to found
        end
    end
end
