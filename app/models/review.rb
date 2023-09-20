class Review < ApplicationRecord
  belongs_to :costume
  belongs_to :user
  validates :rating, presence: true
end
