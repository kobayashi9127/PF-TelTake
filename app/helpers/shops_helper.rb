module ShopsHelper
  def unchecked_notifications
    @notifications = current_shop.notifications.where(checked: false)
  end
end
