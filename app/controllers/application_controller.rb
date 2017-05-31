class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include Pundit
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
  
  private
  
  def user_not_authorized(exception)
    flash[:alert] = "You are not allowed to perform that action."
    redirect_to(request.referrer || root_path)
  end
end
