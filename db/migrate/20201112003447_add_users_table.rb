# frozen_string_literal: true

class AddUsersTable < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :fname
      t.string :lname
      t.string :email
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
