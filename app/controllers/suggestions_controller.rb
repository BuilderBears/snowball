class SuggestionsController < ApplicationController
  before_filter :authorize, only: [:new, :create, :edit, :update]

  def index
    @suggestions = Suggestion.all
  end

  def new
  end

  def create
    # in the future, needs to assign user_id
    suggestion = Suggestion.new(suggestion_params)

    # refactor to do a different action when receiving .json
    # using the respond_to method (ex. generic scaffold code)
    if suggestion.save
      redirect_to topic_path(suggestion.topic)
    else
      # fill in
    end
  end

  def show
    @suggestion = Suggestion.find(params[:id])
  end

  def edit
    @suggestion = Suggestion.find(params[:id])
  end

  def update
    @suggestion = Suggestion.find(params[:id])
    @suggestion.update(suggestion_params)

    redirect_to suggestions_path
  end

  private
  def suggestion_params
    params.require(:suggestion).permit(:description, :url, :topic_id, :user_id, :title)
  end
end
