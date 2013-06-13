class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    debugger
    @user = User.new(params[:user])
    if @user.save
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
end
