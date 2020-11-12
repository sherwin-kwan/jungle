class UsersController < ApplicationController

  def create
    raise User.inspect
    user = User.new(user_params)
    raise user.inspect
    # if user.save
    #   session[:current_user] = user.id
    #   redirect_to :root
    # else
    #   redirect_to :new_user
    # end
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
      :pw_confirm
    )
  end
end
