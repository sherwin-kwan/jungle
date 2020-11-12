class UsersController < ApplicationController

  def create
    raise User.inspect
    @user = User.new(user_params)
  end

  def new
    raise User.inspect
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
