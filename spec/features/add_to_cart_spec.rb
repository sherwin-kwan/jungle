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
    expect(page).to have_text('My Order (0)')

    first_item = find("article.product", match: :first)
    within(first_item) {click_on "Add"}

    save_screenshot
    expect(page).to have_text('My Order (1)')

  end
end
