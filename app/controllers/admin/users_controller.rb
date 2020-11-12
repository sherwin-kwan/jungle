class Admin::UsersController < ApplicationController
  def index
    @users = User.order(:lname).all
  end
end
