class SessionsController < ApplicationController
  def new
  end

  def create
    user_hash = User.authenticate(params[:email], params[:password])
    if user_hash
      session[:user_hash] = user_hash
      redirect_to root_url, :notice => "Signed in!"
    else
      flash.now.alert = "Could not sign in"
      render "new"
    end
  end

  def destroy
    session[:user_hash] = nil
    redirect_to root_url, notice: "Logged out!"
  end
  
end
