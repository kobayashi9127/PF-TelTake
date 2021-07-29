class Notification < ApplicationRecord
  default_scope -> { order(created_at: :desc) } #デフォルトの並び順を「作成日時の降順」で指定(常に新しい通知からデータを取得することができる)
  belongs_to :shop
  belongs_to :comment

  scope :unchecked, -> { where(checked: false) }
  def self.checked!
    unchecked.each { |notification| notification.update!(checked: true) }
  end

end
