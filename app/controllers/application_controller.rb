class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user|
      user.permit(:name, :email, :password, :password_confirmation, :mid_name, :last_name, :address_attributes => [:street])
    end

    devise_parameter_sanitizer.permit(:account_update) do |user|
      user.permit(:password, :password_confirmation, :current_password, :mid_name, :last_name, :position_id, :department_id, :address_attributes => [:street])
    end
  end


end
