class ApplicationController < ActionController::Base
	before_action :configure_devise_parameters, if: :devise_controller?

	protected

	def configure_devise_parameters
		devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:prenom, :nom, :username, :email, :password, :password_confirmation) }
		devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:prenom, :nom, :username, :lienAvatar, :email, :password, :password_confirmation, :biographe, :current_password) }
	end
	def not_found
	  raise ActionController::RoutingError.new('Not Found')
	end
end
