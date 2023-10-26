class Costume < ApplicationRecord
  include AlgoliaSearch

  has_one_attached  :photo
  belongs_to        :owner, class_name: "User", foreign_key: "user_id"
  has_many          :bookings, dependent: :destroy
  has_many          :reviews, dependent: :destroy

  validates          :size, :condition, :price, :name, :gender, :description, presence: true

  SIZE =             ["XS", "S", "M", "L", "XL", "XXL"]
  GENDER =           ["men", "women", "unisex"]
  CONDITION =        ["perfect", "used"]
  validates          :size, inclusion: { in: SIZE }
  validates          :gender, inclusion: { in: GENDER }
  validates          :condition, inclusion: { in: CONDITION }

  # Algolia only for keyword search
  algoliasearch do
    attributes %i[name description]
  end
end
