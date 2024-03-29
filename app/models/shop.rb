class Shop < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :foods, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :notifications, dependent: :destroy

  belongs_to :genre, dependent: :destroy

  attachment :shop_image

  validates :shop_name, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
  validates :login_id, presence: true


  def current_shop?(current_shop)
    self == current_shop
  end

  def self.search(search,genre_id,admin) #self.でクラスメソッドとしている
    if admin
     if search.blank?
        all
     else
       keyword(search)
     end
    else
      if search.blank? && genre_id.blank? #両方空の場合
         order("RAND()").all #全てランダムで表示。
      elsif search.empty? #searchが空でジャンルのみの検索
         where(genre_id: genre_id)
      elsif genre_id.blank? #ジャンルが空の場合
         keyword(search)
      else #両方有りの場合
         keyword(search).where(genre_id: genre_id)
      end
    end
  end

  def self.keyword(search)
   where(['phone_number LIKE(?) OR address LIKE(?) OR shop_name LIKE(?)', "%#{search}%", "%#{search}%", "%#{search}%"]) #where(['検索したいカラム名 ? OR 検索したいカラム名 LIKE ? OR 検索したいカラム名 LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%"])
  end


  def save_notification_comment!(comment_id)
        notification = notifications.new(
        shop_id: id,
        comment_id: comment_id,
        action: 'comment'
      )
      notification.save if notification.valid?
  end

end
