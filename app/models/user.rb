class User < ApplicationRecord
  validates :username, presence: true
  has_many :users_events
  has_many :attended_events, through: :users_events
  has_many :created_events, foreign_key: 'user_id', class_name: 'Event'
end
