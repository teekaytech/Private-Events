class Event < ApplicationRecord
  has_many :users_events
  has_many :attendees, through: :users_events
  belongs_to :creator, class_name: "User", foreign_key: "user_id"
end
