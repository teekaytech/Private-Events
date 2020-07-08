require 'rails_helper'

RSpec.describe 'events_controller', type: :system do
  before :each do
    User.create(username: 'creator', email: 'taofeek@gmail.com')
  end
  
  it 'creates an event' do
    visit login_path
    fill_in :username, with: 'creator'
    click_button('commit')
    visit new_event_path
    fill_in :event_location, with: 'Abuja' 
    fill_in :event_event_date, with: Time.now + 1.week
    fill_in :event_description, with: "It is a good day"
    click_button('Create Event')
    expect(page).to have_content 'Event Created successfully!'
  end
end
