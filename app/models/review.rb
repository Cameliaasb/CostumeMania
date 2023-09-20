class Review < ApplicationRecord
  belongs_to :costume
  belongs_to :user
  validates :rating, :content, presence: true
end
