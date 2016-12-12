class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def show
    @room = Room.find(params[:id])
    @new_review = Review.new
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

  def edit
    @room = Room.find(params[:id])

  end

  def update
    @room = Room.find(params[:id])
    if @room.update(room_params)
      flash[:notice] = "The room was updated"
      redirect_to @room, notice: 'Room saved'
    else
      flash[:alert] = 'There was an error, please try again'
      render :edit
    end
  end

  def destroy
    @room = Room.find(params[:id])
    if @room.destroy
      flash[:notice] = "The room was deleted"
      redirect_to root_path
    else
      flash[:alert] = "Something's worng, please try again."
      render :show
    end
  end

  private
  def room_params
    params.require(:room).permit(:title, :description, :city, :country, :latitude, :longitude)
  end
end
