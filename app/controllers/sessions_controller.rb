class SessionsController < ApplicationController
  def new
  end

  def create
    begin
      user_hash = User.authenticate(params[:email], params[:password])
      if user_hash
        session[:user_hash] = user_hash
        redirect_to root_url, :notice => "Signed in!"
      end
    rescue ExpoMuseesWeb::AuthenticationError => e
      flash.now[:error] = e
      render "new"
    end
  end

  def destroy
    begin
      destroyed = User.destroy(session[:user_hash])
      session[:user_hash] = nil
      redirect_to root_url, notice: "Logged out!"
    rescue ExpoMuseesWeb::AuthenticationError => e
      redirect_to root_url, :flash => { :error => e }
    end
  end
  
end
