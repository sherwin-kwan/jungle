# frozen_string_literal: true

module Admin
  class UsersController < Admin::BaseController
    def index
      @users = User.order(:lname).all
    end

    def destroy
      @user = User.find(params[:id])
      @user.destroy
      redirect_to :admin_users, notice: "User deleted"
    end
  end
end
