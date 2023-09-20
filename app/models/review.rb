class Review < ApplicationRecord
  belongs_to :costume
  validates :rating, presence: true
end
