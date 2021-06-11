class Food < ApplicationRecord
  belongs_to :shop
  attachment :food_image
end
