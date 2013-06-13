class NewspapersController < ApplicationController

  def index

  end

  def new

    @newspaper = Newspaper.new
  end

  def create
    debugger
    @newspaper = Newspaper.new(params[:newspaper])
    if @newspaper.save
      redirect_to newspapers_url
    else
      render :new
    end
  end

  def show
    @newspaper = Newspaper.find(params[:id])
    render :json => @newspaper
  end
end
