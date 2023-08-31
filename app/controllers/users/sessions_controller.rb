# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  #before_action :configure_sign_in_params, only: [:create]
  before_action :check_account_status, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
   def create
     super 
   end

   private 

   def check_account_status
    user = User.find_by(email: params[:user][:email])
    if user
        admin_id = user.admin_id 

        if admin_id.present?
            admin = Admin.find_by(id: admin_id)

            if admin && admin.account.is_active && !admin.account.has_expired 
                return 
            end 
        end

        flash[:alert] = 'Your account is not active or has expired'
        redirect_to root_path 
    else
        flash[:alert] = 'Invalid email address'
        redirect_to root_path 
    end 
  end
   

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
   def configure_sign_in_params
     devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password, :password_confirmation, :admin_id])
   end
end
