class SessionsController < ApplicationController
  def new
  end

  def create
    if request.xhr?
      user = User.find_by(email: params[:email])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        render :json => {:login_status => "success"}
      else
        flash.now.alert = "Email or password is invalid!!"
        render :json => {:login_status => "failure"}
      end
    else
      user = User.find_by(email: params[:email])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to root_path, notice: "Logged in!"
      else
        flash.now.alert = "Email or password is invalid."
        render :new
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end
end
