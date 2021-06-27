class Comment < ApplicationRecord
  belongs_to :shop
  has_many :notifications, dependent: :destroy

  validates :body, presence: true

end
