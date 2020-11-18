require "rails_helper"

RSpec.feature "User signup/login process", type: :feature, js: true do

  # SETUP SEEDS
  before :all do
    load "#{Rails.root}/db/seeds.rb"
  end

  scenario 'check error messages appear if passwords do not match' do
    visit root_path

    click_on "Sign In"

    click_on "Don't have an account?"

    fill_in "First Name", with: "Samuel"
    fill_in "Last Name", with: "Jackson"
    fill_in "Email", with: "samuelljackson@lighthouselabs.ca"
    fill_in "user_password", with: "hunter2"
    fill_in "user_password_confirmation", with: "hunter3"

    click_on "Register"

    expect(page).to have_content("do not match")
  end

  scenario 'check that user accounts can be created' do
    visit root_path

    click_on "Sign In"

    click_on "Don't have an account?"

    fill_in "First Name", with: "Samuel"
    fill_in "Last Name", with: "Jackson"
    fill_in "Email", with: "samuelljackson@lighthouselabs.ca"
    fill_in "user_password", with: "hunter2"
    fill_in "user_password_confirmation", with: "hunter2"

    save_screenshot

    click_on "Register"

    save_screenshot

    expect(page).to have_content("Sign Out") # Shows successfully logged in
  end

end
