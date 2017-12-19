class UsersController < ApplicationController

  before_action :save_login_state, :only => [:new, :create]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "You signed up succesfully"
      flash[:color] = "valid"
    else
      flash[:notice] = "form is invalid"
      flash[:color]= "invalid"
      render "new"
    end
  end
  private
  def user_params
    params.require(:user).permit(:username, :email, :password, :saly, :encrypt_password)
  end
end
