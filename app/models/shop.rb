class Shop < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :foods, dependent: :destroy
  belongs_to :genre, dependent: :destroy
  attachment :shop_image
  def self.search(search,genre_id) #self.でクラスメソッドとしている
    if search.blank? && genre_id.blank?
      Shop.order("RAND()").all #全てランダムで表示。
    elsif search.empty?
      Shop.where(genre_id: genre_id)
    elsif genre_id.blank?
      Shop.where(['phone_number LIKE(?) OR address LIKE(?) OR shop_name LIKE(?)', "%#{search}%", "%#{search}%", "%#{search}%"])
    else
      Shop.where(['phone_number LIKE(?) OR address LIKE(?) OR shop_name LIKE(?)', "%#{search}%", "%#{search}%", "%#{search}%"]).where(genre_id: genre_id) #where(['検索したいカラム名 ? OR 検索したいカラム名 LIKE ? OR 検索したいカラム名 LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%"])
    end
  end
end
