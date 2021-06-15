class Shop < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :foods, dependent: :destroy
  belongs_to :genre, dependent: :destroy
  attachment :shop_image
  def self.search(search) #self.でクラスメソッドとしている
    if search # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
      Shop.where(['address LIKE ?', "%#{search}%"])
    else
      Shop.order("RAND()").all #全てランダムで表示。
    end
  end
end
