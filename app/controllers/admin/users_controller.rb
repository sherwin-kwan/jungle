class Admin::UsersController < ApplicationController
  def index
    @users = User.order(:lname).all
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to :admin_users, notice: "User deleted"
  end
end
