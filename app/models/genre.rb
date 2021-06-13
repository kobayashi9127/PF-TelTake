class Genre < ApplicationRecord
  has_many :shops, dependent: :destroy
end
