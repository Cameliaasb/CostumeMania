class Costume < ApplicationRecord
  include AlgoliaSearch

  has_one_attached :photo
  belongs_to :owner, class_name: "User", foreign_key: "user_id"
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy

  validates :size, :condition, :price, :name, :gender, :age, :description, presence: true

  algoliasearch do
    attributes :name, :description
  end
  
  SIZE = ["XS", "S", "M", "L", "XL"]
  GENDER = ["Men", "Women", "Unisex"]
  AGE = ["Adults", "Kids"]
  CONDITION = ["New", "Average", "Used"]

end
