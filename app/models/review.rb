class Review < ApplicationRecord
  belongs_to :restaurant
  has_many :answers

  validates :content, :rating, presence: true

  validates :rating, numericality: { only_integer: true }
  validates :rating, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
end
