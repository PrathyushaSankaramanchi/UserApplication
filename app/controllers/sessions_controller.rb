class SessionsController < ApplicationController
  def new
    @title = "Sign in"
  end
  
  def create
    user = User.find_by_email(params[:session][:email])    
    if user      
        session[:user] = user.id        
        flash[:message] = user.name
        redirect_to home_url
    else
        @title = "Sign in"
        flash.now[:error] = 'Invalid Credentials'
        redirect_to signin_url, :notice => "Invalid credentials.! Please login again..!!"  
    end 
  end
  
  def destroy
    session[:user_id] = nil      
    redirect_to signin_url, :notice => "Logged out!"
  end
end
