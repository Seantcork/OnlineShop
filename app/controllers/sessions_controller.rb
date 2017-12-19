class SessionsController < ApplicationController

  before_action :authenticate_user, :only => [:home, :profile, :setting]
  before_action :save_login_state, :only => [:login, :login_attempt]
  def login
    #Login Form
  end
  def login_attempt
    authorized_user = User.authenticate(params[:username_or_email],params[:login_password])
    if authorized_user
      @login_error = false
      session[:user_id] = authorized_user.id
      redirect_to controller: 'shopping_cart', action:'index', user: authorized_user.username
    else
      @login_error = true
      render "login"
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to :action => 'login'
    ShopCart.delete(ShopCart.all)
  end
  def home
  end

  def profile
  end

  def setting
  end
end
