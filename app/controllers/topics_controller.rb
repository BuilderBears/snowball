class TopicsController < ApplicationController
  before_filter :authorize, only: [:new, :create, :edit, :update, :upvote_response]

  def index
    @topics = Topic.all
  end

  def new
  end

  def create
    topic = Topic.new(topic_params)

    if topic.save
      redirect_to topics_path
    else
      render :new
    end
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])
    @topic.update(topic_params)

    redirect_to topics_path
  end

  def upvote_response
    response_id = params["response_id"]
    user_id = session["user_id"]
    response = Response.find(response_id)
    response.upvotes.create(user_id: user_id) 
    response.save
    new_upvote_count = response.upvotes.count
    render :json => {:upvote_count => new_upvote_count}
  end

  private
  def topic_params
    params.require(:topic).permit(:title, :description, :user_id, :response_attributes => [:title, :url, :user_id, :description])
  end
end
