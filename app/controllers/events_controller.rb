class EventsController < ApplicationController
  before_action :move_to_index
  before_action :set_event, only: [:edit, :show, :update]

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.create(event_params)
    if @event.save
      redirect_to events_path
    else
      render 'new'
    end
  end

  def show
  end

  def destroy
    event = Event.find(params[:id])
    event.destroy
  end

  def edit
  end

  def update
    @event.update(event_params)
    if @event.save
      redirect_to events_path
    else
      render 'edit'
    end
  end

  private

  def event_params
    params.require(:event).permit(:subject, :start_time, :ending_time, :place, :details).merge(school_id: current_school.id)
  end

  def set_event
    @event = Event.find(params[:id])
  end

  def move_to_index
    unless school_signed_in? || user_signed_in?
      redirect_to root_path
    end
  end

end
