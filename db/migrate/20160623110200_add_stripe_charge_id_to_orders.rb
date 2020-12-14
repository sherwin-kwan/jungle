# frozen_string_literal: true

class AddStripeChargeIdToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :stripe_charge_id, :string
  end
end
