class RoomsController < ApplicationController

  def index
    @rooms = Room.all
  end

  def show
    @room = Room.includes(:user, :reviews).find(params[:id])
    @new_review = Review.new
  end

  def new
    if check_role
      @room = Room.new
      @room.images.build
    else
      flash[:alert] = "You are not a host"
      redirect_to root_path
    end
  end

  def create
    if check_role
      @room = current_user.rooms.build(room_params)
      if @room.save
        redirect_to @room, notice: 'Room saved'
      else
        flash[:alert] = 'There was an error, please try again'
        render :new
      end
    else
      flash[:alert] = "You are not a host"
      redirect_to root_path
    end
  end

  def edit
    @room = Room.find(params[:id])
    render root_path unless check_owner(@room)
  end

  def update
    @room = Room.find(params[:id])
    if check_owner(@room)
      if @room.update(room_params)
        flash[:notice] = "The room was updated"
        redirect_to @room, notice: 'Room saved'
      else
        flash[:alert] = 'There was an error, please try again'
        render :edit
      end
    else
      flash[:alert] = "You didn't own this room"
      redirect_to @room
    end
  end

  def destroy
    @room = Room.find(params[:id])
    if check_owner(@room)
      if @room.destroy
        flash[:notice] = "The room was deleted"
        redirect_to root_path
      else
        flash[:alert] = "Something's worng, please try again."
        render :show
      end
    else
      flash[:alert] = "You can't delete other user's room."
      redirect_to @room
    end
  end

  private
  def room_params
    params.require(:room).permit(:title, :description, :city, :country, :latitude, :longitude,
      images_attributes: [:file])
  end

  def check_role
    if current_user.role == 'host'
      true
    else
      false
    end
  end

  def check_owner(room)
    if room.user_id == current_user.id
      true
    else
      false
    end
  end
  
end
