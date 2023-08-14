class ApplicationController < ActionController::Base
before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:admin])
  end


     rescue_from CanCan::AccessDenied do |exception|
    redirect_to @project, alert: "Access denied."
  end

   private

  def authenticate_admin!
    unless current_user && current_user.admin?
      flash[:alert] = "You don't have permission to access this page."
      redirect_to root_path
    end
  end
end
