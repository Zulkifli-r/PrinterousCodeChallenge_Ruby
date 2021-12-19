class ApplicationController < ActionController::Base
  layout :set_layout
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  private

  def set_layout
    if user_signed_in?
      'application'
    else
      'auth'
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password) }

    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :email, :password, :current_password)
    end
  end

  def authenticate_admin!
    authenticate_user!
    redirect_to root_path unless current_user.admin?
  end
end
