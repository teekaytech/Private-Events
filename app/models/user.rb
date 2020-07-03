class User < ApplicationRecord
  has_many :created_events, foreign_key: "user_id", class_name: "Event"

end
