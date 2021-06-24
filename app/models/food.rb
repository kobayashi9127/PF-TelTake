class Food < ApplicationRecord
  belongs_to :shop
  attachment :food_image

  validates :food_image, presence: true
  validates :food_name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true

end
