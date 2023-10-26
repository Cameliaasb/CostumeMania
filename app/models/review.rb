class Review < ApplicationRecord
  belongs_to  :costume
  belongs_to  :user

  validates   :user, uniqueness: { scope: :costume }
  validates   :rating, :content, presence: true
end
