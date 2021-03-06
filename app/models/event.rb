class Event < ApplicationRecord
  validates_presence_of :location, :event_date, :description
  has_many :users_events
  has_many :attendees, through: :users_events
  belongs_to :creator, class_name: 'User'

  scope :previous_events, -> { where('event_date < ?', Time.now) }
  scope :upcoming_events, -> { where('event_date > ?', Time.now) }
end
