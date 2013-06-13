class SubscriptionPlansController < ApplicationController

  def new
    @newspaper = Newspaper.find(params[:newspaper_id])
    @sub_plan = SubscriptionPlan.new
  end

  def create
    debugger
    @newspaper = Newspaper.find(params[:newspaper_id])
    @sub_plan = SubscriptionPlan.new(params[:sub_plan])
    if @sub_plan.save
      redirect_to newspapers_url
    else
      render :new
    end
  end
end
