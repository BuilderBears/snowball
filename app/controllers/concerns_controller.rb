class ConcernsController < ApplicationController
  before_filter :authorize, only: [:new, :create, :edit, :update]

  def index
    @concerns = Concern.all
  end

  def new
  end

  def create
    concern = Concern.new(concern_params)

    if concern.save
      redirect_to concerns_path
    else
      render :new
    end
  end

  def show
    @concern = Concern.find(params[:id])
  end

  def edit
    @concern = Concern.find(params[:id])
  end

  def update
    @concern = Concern.find(params[:id])
    @concern.update(concern_params)

    redirect_to concerns_path
  end

  private
  def concern_params
    params.require(:concern).permit(:title, :description, :user_id, :response_attributes => [:title, :url, :user_id])
  end
end
