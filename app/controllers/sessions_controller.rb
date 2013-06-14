require 'bcrypt'
class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by_name(params[:user][:name])
    password = params[:password]

    if @user && BCrypt::Password.new(@user.password_digest) == password
      login!(@user)
      redirect_to user_url(@user)
    else
      flash[:notice] = 'incorrect username and/or password'
      render :new
    end
  end

  def destroy
    logout
    redirect_to new_session_url
  end
end
