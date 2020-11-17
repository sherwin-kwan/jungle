class UsersController < ApplicationController

  def create
    user = User.new(user_params)

    if user.save
      session[:current_user] = user.id
      redirect_to :root
    else
      redirect_to :new_user
    end
  end


  def new
    @user = User.new
  end

  private

  def user_params
    params.require(:user).permit(
      :fname,
      :lname,
      :email,
      :password,
      :password_confirmation
    )
  end
end
