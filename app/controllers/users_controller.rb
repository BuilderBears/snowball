class UsersController < ApplicationController

  def sort_suggestions
    @user = User.find(params[:id])
    @user.suggestions.sort_by do |suggestion| 
      suggestion.upvotes.count
    end.reverse!
  end

  def show
    @user = User.find(params[:id])
    @sorted_suggestions = sort_suggestions
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Thank you for signing up!"
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
