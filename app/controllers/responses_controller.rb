class ResponsesController < ApplicationController
  def index
    @responses = Response.all
  end

  def new
  end

  def create
    response = Response.new(response_params)

    if response.save
      redirect_to responses_path
    else
      render 'new'
    end
  end

  def show
    @response = Response.find(params[:id])
  end

  def edit
    @response = Response.find(params[:id])
  end

  def update
    @response = Response.find(params[:id])
    @response.update(response_params)

    redirect_to responses_path
  end

  private
  def response_params
    params.require(:response).permit(:title, :url)
  end
end
