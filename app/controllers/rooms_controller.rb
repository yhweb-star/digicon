class RoomsController < ApplicationController

  def index
    if user_signed_in?
      @schools = School.all
      rooms = current_user.rooms
      @school_ids = []
      rooms.each do |r|
        @school_ids << r.school_id
      end
    elsif school_signed_in?
      @users = User.all
      rooms = current_school.rooms
      @user_ids = []
      rooms.each do |r|
        @user_ids << r.user_id
      end
    end
  end

  def show
    @room = Room.find(params[:id])
    @message = Message.new
    @messages = @room.messages
    if user_signed_in?
      if @room.user.id == current_user.id
        @school = @room.school
      else
        redirect_to "/"
      end
    elsif school_signed_in?
      if @room.school.id == current_school.id
        @user = @room.user
      else
        redirect_to "/"
      end

    else
      redirect_to "/"
    end
  end

  def create
    if user_signed_in?
      @room = Room.new(room_school_params)
      @room.user_id = current_user.id
    elsif school_signed_in?
      @room = Room.new(room_user_params)
      @room.school_id = current_school.id
    else
      redirect_to "/"
    end

    if @room.save
      redirect_to :action => "show", :id => @room.id
    else
      redirect_to "/"
    end
  end

  private
  def room_school_params
    params.require(:room).permit(:school_id)
  end

  def room_user_params
    params.require(:room).permit(:user_id)
  end
end
