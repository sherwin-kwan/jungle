# frozen_string_literal: true

class FixUsersTable < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :fname, :given_name
    rename_column :users, :lname, :name
    add_column :users, :phone, :string, limit: 20
    #: Note - phone numbers not treated as numbers since they are a string of digits to be dialed. Also, standard formats have non-numerical characters
    # For example: +16041234567 or 123-456-7890
    add_column :users, :is_guest, :boolean, null: false
    # The is_guest column is used to determine whether this is a one-time sale (user will not return, has no password, and thus cannot log in)
  end
end
