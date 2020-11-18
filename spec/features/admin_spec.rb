require 'rails_helper'

RSpec.feature "Admins", type: :feature, js: true do

  # SETUP SEEDS
  before :each do
    load "#{Rails.root}/db/seeds.rb"
  end

  scenario 'Admin pages should be inaccessible without authentication' do
    visit root_path
    click_on "Admin"
    save_screenshot
    click_on "Dashboard"
    expect(page).not_to have_content("Admin Dashboard") # Should not allow the user to visit the page without http-basic-authenticate
  end

  scenario 'Admin pages can be accessed with authentication' do
    visit root_path
    page.driver.basic_authorize(ENV['ADMIN_USERNAME'], ENV['ADMIN_PASSWORD'])
    click_on "Admin"
    click_on "Dashboard"
    expect(page).to have_content("Admin Dashboard") # Now page should be visitable
    save_screenshot
  end
end
