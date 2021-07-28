class Food < ApplicationRecord
  belongs_to :shop
  has_many :tags
  attachment :food_image

  validates :food_image, presence: true
  validates :food_name, presence: true
  validates :price, presence: true

  def create_tags!
    tags.destroy_all if tags.present?

    image_tags = Vision.get_image_data(food_image)
    image_tags.each do |tag|
      tags.create(name: tag)
    end

  end

end
