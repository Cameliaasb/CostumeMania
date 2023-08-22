class Costume < ApplicationRecord
  has_one_attached :photo
  belongs_to :owner, class_name: "User", foreign_key: "user_id"

  validates :size, :condition, :price, presence: true
end
