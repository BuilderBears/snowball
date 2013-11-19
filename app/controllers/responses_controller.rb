class ResponsesController < ApplicationController
  before_filter :authorize, only: [:new, :create, :edit, :update]

  def index
    @responses = Response.all
  end

  def new
  end

  def create
    # in the future, needs to assign user_id
    response = Response.new(response_params)

    # refactor to do a different action when receiving .json
    # using the respond_to method (ex. generic scaffold code)
    if response.save
      redirect_to concern_path(response.concern)
    else
      # fill in
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
    params.require(:response).permit(:title, :url, :concern_id, :user_id)
  end
end
