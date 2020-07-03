class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    user = User.find(session[:current_user_id])
    @event = user.created_events.build(event_params)
    pp @event
    if @event.save
      redirect_to event_path(@event), notice: 'Event Created successfully!' 
    else
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  private

  def event_params
    params.require(:event).permit([:location, :event_date, :description, :user_id])
  end
end
