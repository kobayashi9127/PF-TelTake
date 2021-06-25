class Shop < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :foods, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy
  has_many :notifications, dependent: :destroy

  belongs_to :genre, dependent: :destroy

  attachment :shop_image

  validates :shop_name, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
  validates :holiday, presence: true
  validates :opening_hours1, presence: true
  validates :opening_hours2, presence: true
  validates :login_id, presence: true
  validates :genre_id, presence: true

  def current_shop?(current_shop)
    self == current_shop
  end

  def self.search(search,genre_id,admin) #self.でクラスメソッドとしている
    if admin
     if search.blank?
       Shop.all
     else
       Shop.keyword(search)
     end
    else
      if search.blank? && genre_id.blank?
        Shop.order("RANDOM()").all#全てランダムで表示。
      elsif search.empty?
        Shop.where(genre_id: genre_id)
      elsif genre_id.blank?
        Shop.keyword(search)
      else
        Shop.keyword(search).where(genre_id: genre_id) #where(['検索したいカラム名 ? OR 検索したいカラム名 LIKE ? OR 検索したいカラム名 LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%"])
      end
    end
  end

  def self.keyword(search)
    Shop.where(['phone_number LIKE(?) OR address LIKE(?) OR shop_name LIKE(?)', "%#{search}%", "%#{search}%", "%#{search}%"])
  end


end
