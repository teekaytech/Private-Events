require 'rails_helper'

RSpec.describe 'events_controller', type: :system do
  before :each do
    @user = User.create(username: 'creator', email: 'taofeek@gmail.com')
  end

  describe 'events management' do
    before :each do
      visit login_path
      fill_in :username, with: 'creator'
      click_button('commit')
      @event = Event.create(user_id: @user.id, location: 'Abuja',
                            event_date: Time.now + 1.week, description: 'It is a good day')
    end
    it 'creates an event' do
      visit new_event_path
      fill_in :event_location, with: 'Abuja'
      fill_in :event_event_date, with: Time.now + 1.week
      fill_in :event_description, with: 'It is a good day'
      click_button('Create Event')
      expect(page).to have_content 'Event Created successfully!'
    end

    it 'attends an event' do
      visit event_path(@event)
      click_link('Attend Event')
      expect(page).to have_content 'You have successfully registered for the event'
    end
  end
end
