class EventsController < ApplicationController
  before_action :authenticate_user, only: %i[attend new]

  def index
    @past_events = Event.previous_events
    @upcoming_events = Event.upcoming_events
  end

  def new
    @event = Event.new
  end

  def create
    user = User.find(session[:current_user_id])
    @event = user.created_events.build(event_params)
    if @event.save
      redirect_to event_path(@event), notice: 'Event Created successfully!'
    else
      flash.notice = 'Please all fields must be filled'
      render :new 
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def attend
    event = Event.find(params[:id])
    if current_user.attended_events.exists?(params[:id])
      redirect_to event_path(event), notice: 'You have already registered for this event!'
    else
      a = current_user.users_events.build(event_id: params[:id])
      if a.save
        redirect_to events_path, notice: 'You have successfully registered for the event'
      else
        render :show, notice: 'Unable to register you for the event'
      end
    end
  end

  private

  def event_params
    params.require(:event).permit(%i[location event_date description user_id])
  end
end
