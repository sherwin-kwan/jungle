class SessionsController < ApplicationController

  def create
    # Call the authenticate_by_email function to check if this email/password pair is valid
    user = User.authenticate_by_email(params[:email], params[:password])
    if user
      # Save the user id inside the browser cookie. This is how we keep the user 
      # logged in when they navigate around our website.
      session[:current_user] = user.id
      redirect_to :root
    else
    # If user's login doesn't work, send them back to the login form.
      redirect_to :users_login
    end
  end

  def destroy
    session[:current_user] = nil
    # Go back to homepage after signing out
    redirect_to :root
  end

  def new
    
  end
end
