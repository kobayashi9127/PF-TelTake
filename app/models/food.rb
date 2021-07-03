class Food < ApplicationRecord
  belongs_to :shop
  has_many :tags
  attachment :food_image

  validates :food_image, presence: true
  validates :food_name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true

end
