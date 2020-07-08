require 'rails_helper'

RSpec.describe 'events_controller', type: :system do
  describe 'index page' do
    it 'shows the right content' do
      visit root_path
      expect(page).to have_content('Past Events')
    end
  end
end
