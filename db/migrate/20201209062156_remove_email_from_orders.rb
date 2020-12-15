# frozen_string_literal: true

class RemoveEmailFromOrders < ActiveRecord::Migration[6.0]
  def change
    # Email should be taken from joined users table since orders table has a user_id foreign key
    remove_column :orders, :email, :string
  end
end
