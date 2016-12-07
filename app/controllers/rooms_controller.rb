class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def show
    @room = Room.find(params[:id])
  end

  def new
    @room = Room.new
  end

  def create
    @room = current_user.rooms.build(room_params)
    if @room.save
      redirect_to @room, notice: 'Room saved'
    else
      flash[:alert] = 'There was an error, please try again'
      render :new
    end
  end

  private
  def room_params
    params.require(:room).permit(:title, :description, :city, :country, :latitude, :longitude)
  end
end
