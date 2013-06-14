require 'bcrypt'
class UsersController < ApplicationController

before_filter :authenticate, :except => [:new, :create]

  def new
    @user = User.new
  end

  def create
    
    @user = User.new(params[:user])
    @user.password_digest = BCrypt::Password.create(params[:password])

    if @user.save
      session[:token] = @user.token
      login!(@user)
      redirect_to user_url(@user)
    else
      render :new
    end
  end

  def show
    
    @user = User.find(params[:id])
    @sub_plans = @user.subscription_plans
    @newspapers = @user.newspapers
  end

  def authenticate
    if !logged_in? || User.find(params[:id]) != current_user
      flash[:notice] = 'you cannot view this page, sign in and try again'
      redirect_to new_session_url
    end
  end



end
