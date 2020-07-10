require 'rails_helper'

RSpec.describe 'users_controller', type: :system do
  before :each do
    User.create(username: 'creator', email: 'taofeek@gmail.com')
  end

  it 'authenticates the user' do
    visit login_path
    fill_in :username, with: 'creator'
    click_button('commit')
    expect(page).to have_content 'Login successful'
  end
end
