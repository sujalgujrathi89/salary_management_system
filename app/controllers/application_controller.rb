class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_devise_params ,if: :devise_controller?
 
  def configure_devise_params
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:name, :address, :contact_no,:email,:password,:password_confirmation)
    end
  end 

  def after_confirmation_path_for(resource,resource_name) 
    if resource.is_active?
      redirect_to new_user_path 
    else
      redirect_to new_user_session_path
    end    	
  end 

  def after_sign_in_path_for(resource)
    if resource.is_admin?
	    admins_path
	  else
	    current_user
  	end    	
  end	
end
