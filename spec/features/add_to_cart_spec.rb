require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
  
  # SETUP SEEDS
  before :all do
    load "#{Rails.root}/db/seeds.rb"
  end

  scenario 'should be able to add items to cart' do
    visit root_path

    click_on "Sign In"

    click_on "Don't have an account?"

    fill_in "First Name", with: "Samuel"
    fill_in "Last Name", with: "Jackson"
    fill_in "Email", with: "samuelljackson@lighthouselabs.ca"
    fill_in "user_password", with: "hunter2"
    fill_in "user_password_confirmation", with: "hunter2"

    click_on "Register"

    expect(page).to have_content("Sign Out") 

    # Check for SOLD OUT items
    ice_cream = find("article.product", text: "Ice Cream")
    expect(ice_cream).to have_content("SOLD OUT")
    # Make sure add to cart button is disabled when the item is sold out
    expect(ice_cream).to have_button('Add', disabled: true)

    takoyaki = find("article.product", text: "Takoyaki")
    expect(takoyaki).to have_button('Add', disabled: false)

    expect(page).to have_text('My Order (0)')

    within(takoyaki) {click_on "Add"}

    save_screenshot
    expect(page).to have_text('My Order (1)')

  end
end
