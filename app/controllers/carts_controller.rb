# frozen_string_literal: true

class CartsController < ApplicationController
  # before_action :authorize
  skip_before_action :verify_authenticity_token

  def show
    @email = @current_user ? @current_user.email : "Guest"
  end

  # Items in the format [{id: 1, quantity: 2}, {id: 2, quantity: 3}] meaning "2 orders of item ID 1 and 3 orders of item ID 2"
  def fill
    cart = {}
    params[:_json].each do |item|
      cart[item[:id]] = item[:quantity]
    end
    update_cart cart
    render plain: "OK"
  end

  def add_item
    product_id = params[:product_id].to_s
    modify_cart_delta(product_id, +1)

    redirect_back(fallback_location: root_path)
  end

  def remove_item
    product_id = params[:product_id].to_s
    modify_cart_delta(product_id, -1)

    redirect_back(fallback_location: root_path)
  end

  private

  def modify_cart_delta(product_id, delta)
    cart[product_id] = (cart[product_id] || 0) + delta
    cart.delete(product_id) if cart[product_id] < 1
    update_cart cart
  end
end
