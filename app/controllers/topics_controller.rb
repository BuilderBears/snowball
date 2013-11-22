class TopicsController < ApplicationController
  before_filter :authorize, only: [:new, :create, :edit, :update, :upvote_suggestion]

  def index
    @topics = Topic.all
    @sorted_topics = @topics.sort_by { |topic| topic.suggestions.count }.reverse

    third_of_topics = @sorted_topics.count / 3

    @column_1 = []
    @column_2 = []
    @column_3 = []

    third_of_topics.times do
      @column_1 << @sorted_topics.shift
    end

    third_of_topics.times do
      @column_2 << @sorted_topics.shift
    end

    third_of_topics.times do
      @column_3 << @sorted_topics.shift
    end
    
    if @sorted_topics.size == 1
      @column_1 << @sorted_topics.shift
    elsif @sorted_topics.size == 2
      @column_2 << @sorted_topics.shift
    end

  end

  def new
    # if !user_signed_in?
    #   render :json => {:error => "login"}
    # end
  end

  def create
    topic = Topic.new(topic_params)

    if topic.save
      redirect_to topics_path
    else
      render :new
    end
  end

  def sort_suggestions
    @topic = Topic.find(params[:id])
    @topic.suggestions.sort_by do |suggestion| 
      suggestion.upvotes.count
    end.reverse!
  end

  def show
    @topic = Topic.find(params[:id])
    @sorted_suggestions = sort_suggestions
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])
    @topic.update(topic_params)

    redirect_to topics_path
  end

  def upvote_suggestion
    suggestion_id = params["suggestion_id"]
    user_id = session["user_id"]
    suggestion = Suggestion.find(suggestion_id)
    suggestion.upvotes.create(user_id: user_id) 
    suggestion.save
    new_upvote_count = suggestion.upvotes.count
    render :json => {:upvote_count => new_upvote_count}
  end

  private
  def topic_params
    params.require(:topic).permit(:title, :description, :user_id, :tag_names, :suggestion_attributes => [:title, :url, :user_id, :description])
  end
end
