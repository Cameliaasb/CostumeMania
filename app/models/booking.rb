class Booking < ApplicationRecord
  belongs_to :client, class_name: "User", foreign_key: "user_id"
  belongs_to :costume
  has_one  :review
end
