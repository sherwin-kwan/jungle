require "rails_helper"

RSpec.feature "User signup/login process", type: :feature, js: true do

  # SETUP SEEDS
  before :all do
    load "#{Rails.root}/db/seeds.rb"
  end

  scenario 'check that user accounts can be created and subsequent login is possible' do
    visit root_path

    click_on "Sign In"

    click_on "Don't have an account?"

    fill_in "First Name", with: "Samuel"
    fill_in "Last Name", with: "Jackson"
    fill_in "Email", with: "samuelljackson@lighthouselabs.ca"
    fill_in "user_password", with: "hunter2"
    fill_in "user_password_confirmation", with: "hunter2"

    click_on "Register"

    expect(page).to have_content("Sign Out") # Shows successfully logged in, then sign out and sign in again
    click_on "Sign Out"

    expect(page).to have_content("Sign In")
    click_on "Sign In"

    fill_in "Email", with: "samuelljackson@lighthouselabs.ca"
    fill_in "Password", with: "hunter2"

    click_on "Submit"

    expect(page).to have_content("Sign Out")

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

    expect(page).to have_content("doesn't match")
    expect(page).to have_selector("input[value='Jackson']") # name should persist after an invalid signup attempt
  end



end
