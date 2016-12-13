require 'digest/md5'

class MembersController < ApplicationController
  def show
    @user = User.find(params[:id])
    
  end
end
