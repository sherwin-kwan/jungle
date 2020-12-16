# frozen_string_literal: true

# Controller for orders routes
class OrdersController < ApplicationController

  def index
    if session[:current_user]
      @orders = Order.find_by(user_id: session[:current_user])
    else
      @orders = [];
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    charge = perform_stripe_charge
    order = create_order(charge)

    if order.valid?
      empty_cart!
      redirect_to order, notice: "Your Order has been placed."
    else
      redirect_to cart_path, flash: { error: order.errors.full_messages.first }
    end
  rescue StandardError, Stripe::CardError => e
    redirect_to cart_path, flash: { error: e.message }
  end

  private

  def empty_cart!
    # empty hash means no products in cart :)
    update_cart({})
  end

  def perform_stripe_charge
    Stripe::Charge.create(
      source: params[:stripeToken],
      amount: cart_subtotal_cents,
      description: "Your Yonago takeout order",
      currency: "cad"
    )
  end

  def create_order(stripe_charge)
    order = Order.new(
      user_id: session[:current_user],
      total_cents: cart_subtotal_cents,
      stripe_charge_id: stripe_charge.id # returned by stripe
      # status_id: 0
    )

    enhanced_cart.each do |entry|
      product = entry[:product]
      quantity = entry[:quantity]
      order.line_items.new(
        product_id: product.id,
        quantity: quantity,
        item_price: product.price,
        total_price: product.price * quantity
      )
    end
    order.save!
    order
  end
end
