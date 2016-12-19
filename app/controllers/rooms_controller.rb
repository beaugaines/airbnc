class RoomsController < ApplicationController

  def index
    @rooms = Room.all
  end

  def show
    @room = Room.find(params[:id]).includes(:user)
    @new_review = Review.new
  end

  def new
    check_role
    @room = Room.new
    @room.images.build
  end

  def create
    check_role
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
    check_owner(@room)
  end

  def update
    @room = Room.find(params[:id])
    check_owner(@room)
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
    check_owner(@room)
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
    params.require(:room).permit(:title, :description, :city, :country, :latitude, :longitude,
      images_attributes: [:file])
  end

  def check_role
    if current_user.role != 'host'
      raise 'You are not a host'
    end
  end

  def check_owner(room)
    if room.user_id != current_user.id
      raise 'You are not the owner'
      render root_path
    end
  end
end
