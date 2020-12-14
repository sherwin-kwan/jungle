# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Carts and orders", type: :feature, js: true do
  # SETUP
  before :all do
    load "#{Rails.root}/db/seeds.rb"
    visit root_path
    click_on "Sign In"

    click_on "Don't have an account?"

    fill_in "First Name", with: "Samuel"
    fill_in "Last Name", with: "Jackson"
    fill_in "Email", with: "samuelljackson@lighthouselabs.ca"
    fill_in "user_password", with: "hunter2"
    fill_in "user_password_confirmation", with: "hunter2"

    click_on "Register"
  end

  it "no order table if cart is empty" do
    # Log in first
    visit root_path
    click_on "Sign In"
    fill_in "Email", with: "samuelljackson@lighthouselabs.ca"
    fill_in "Password", with: "hunter2"
    click_on "Submit"

    expect(page).to have_content("Sign Out")
    click_on("My Order (0)")

    # On orders page, there should be a no-items message and a link back to homepage
    the_div = find("div", text: "no items")
    expect(the_div).to have_selector('a[href="/"]')
  end
end
