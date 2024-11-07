# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:new, :create], if: :devise_controller?
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :current_user

  

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def after_sign_in_path_for(resource)
    if resource.admin?
      admin_root_path # Redirect to the admin dashboard
    else
      super # Redirect to the default path for regular users
    end
  end
end
