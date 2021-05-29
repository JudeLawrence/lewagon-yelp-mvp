class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy

  RESTAURANT_CATEGORIES = %w(chinese italian japanese french belgian)
  validates :category,
            inclusion: {
              in: RESTAURANT_CATEGORIES,
              message: "%{value} is not a valid size"
            }

  validates :name, presence: true
  validates :address, presence: true
end
