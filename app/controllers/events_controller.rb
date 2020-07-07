class EventsController < ApplicationController

  def index
    # @events = Event.all
    @past_events = Event.previous_events
    @upcoming_events = Event.upcoming_events
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

  def attend
    event = Event.find(params[:id])
    a = UsersEvent.new
    a.user_id = current_user.id
    a.event_id = event.id
    if a.save
      redirect_to events_path, notice: 'You have successfully registered for the event'
    else
      render :show, notice: 'Unable to register you for the event'
    end
  end

  private

  def event_params
    params.require(:event).permit([:location, :event_date, :description, :user_id])
  end
end
