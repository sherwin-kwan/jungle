require "rails_helper"

RSpec.feature "Ordering", type: :feature, js: true do

  # Set up seeds and create a user account
  before :each do
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

  scenario "should not be able to add sold-out items to cart" do

    # Make sure user logged in successfully
    expect(page).to have_content("Sign Out")

    # Check for SOLD OUT items
    ice_cream = find("article.product", text: "Ice Cream")
    expect(ice_cream).to have_content("SOLD OUT")
    # Make sure add to cart button is disabled when the item is sold out
    expect(ice_cream).to have_button("Add", disabled: true)
  end

  scenario "should be able to add items to cart, and go to orders" do
    takoyaki = find("article.product", text: "Takoyaki")
    expect(takoyaki).to have_button("Add", disabled: false)

    expect(page).to have_text("My Order (0)")

    (0...10).each do
      within(takoyaki) { click_on "Add" }
    end
    expect(page).to have_text("My Order (1)")
    click_on "My Order (1)"

    expect(page).to have_content("samuelljackson@lighthouselabs.ca")
    # Should be on orders page with a quantity of 10 (10 takoyaki orders costs $99.90)
    the_table = find("table")
    save_screenshot
    expect(the_table).to have_content("Takoyaki")
    expect(the_table).to have_content("Octopus balls")
    expect(the_table).to have_selector("img")
    expect(the_table).to have_content("10")
    expect(the_table).to have_content("99.90")
  end
end
