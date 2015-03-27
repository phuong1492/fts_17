class Users::RegistrationsController < Devise::RegistrationsController
  protected
  def after_update_path_for(resource)
    current_user
  end

  private
  def sign_up_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
 
  def account_update_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :current_password, :avatar)
  end
end