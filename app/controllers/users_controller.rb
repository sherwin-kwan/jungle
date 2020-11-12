class UsersController < ApplicationController

  def create
    raise User.inspect
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

  def user_params
    params.require(:user).permit(
      :fname,
      :lname,
      :email,
      :pw,
      :pw_confirm
    )
  end
end
