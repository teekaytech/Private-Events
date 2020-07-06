class Event < ApplicationRecord
  has_many :users_events
  has_many :attendees, through: :users_events
  belongs_to :creator, class_name: "User", foreign_key: "user_id"

  scope :previous_events, -> { where('event_date < ?', Time.now) }
  scope :upcoming_events, -> { where('event_date > ?', Time.now) }
end
