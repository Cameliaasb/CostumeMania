class Costume < ApplicationRecord
  include AlgoliaSearch

  has_one_attached :photo
  belongs_to :owner, class_name: "User", foreign_key: "user_id"
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy

  validates :size, :photo, :condition, :price, :name, :gender, :description, presence: true

  # Algolia only for keyword search
  algoliasearch do
    attributes %i[name description]
  end

  SIZE = ["XS", "S", "M", "L", "XL", "XXL"]
  GENDER = ["men", "women", "unisex"]
  CONDITION = ["perfect", "used"]
end
