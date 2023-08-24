class Costume < ApplicationRecord
  include AlgoliaSearch

  has_one_attached :photo
  belongs_to :owner, class_name: "User", foreign_key: "user_id"
  has_many :bookings, dependent: :destroy

  validates :size, :condition, :price, :name, :gender, :age, :description, presence: true

  algoliasearch do
    attributes :name, :description
  end
end
