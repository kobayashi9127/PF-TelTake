class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:shop_name, :address, :phone_number, :login_id, :email, :encrypted_password])
  end

  def after_sign_in_path_for(resource)
    shop_path(resource)
  end

end
