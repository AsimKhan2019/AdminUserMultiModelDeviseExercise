class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

	#config.to_prepare do
	#	devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation, :account_id])
	#	devise_parameter_sanitizer.permit(:account_update, keys: [:email, :password, :password_confirmation, :current_password, :account_id])
	#end

	protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation, :account_id])
		devise_parameter_sanitizer.permit(:account_update, keys: [:email, :password, :password_confirmation, :current_password, :account_id])
	end
end
