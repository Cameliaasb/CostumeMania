class Costume < ApplicationRecord
  has_one_attached :photo
  belongs_to :owner, class_name: "User", foreign_key: "user_id"
  has_many :bookings

  validates :size, :condition, :price, :name, presence: true
end
