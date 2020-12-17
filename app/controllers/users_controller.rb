# frozen_string_literal: true

class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    @user.is_guest = false

    # If the db query fails, ActiveRecord does not throw an error, but instead the "save" method returns false.
    # So, put a condition to handle the error.
    if @user.save
      session[:current_user] = @user.id
      redirect_to :root
    else
      redirect_to :new_user,
                  flash: { original_name: @user.name, original_given_name: @user.given_name,
                           errors: @user.errors.full_messages }
    end
  end

  def create_guest
    @user = User.new({
      email: user_params.email,
      is_guest: true,
    })

    if @user.save
      session[:current_user] = @user.id
    else
      raise "Guest user could not be created"
    end
  end

  def new
    @user = User.new
  end

  private

  def user_params
    params.require(:user).permit(
      :name,
      :given_name,
      :email,
      :password,
      :password_confirmation
    )
  end
end
