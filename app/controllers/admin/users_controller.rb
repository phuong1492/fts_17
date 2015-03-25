class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_user
  include UsersHelper
  
  def index
    @users = User.without_user(current_user).paginate page: params[:page], 
      per_page: 5
  end

  def show
    @user = User.find params[:id]
  end

  private
  def admin_user
    redirect_to root_url unless user_admin? 
  end

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
  end
end