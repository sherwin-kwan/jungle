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

  scenario 'Admins can create new categories, and create new products with those categories' do
    visit root_path
    page.driver.basic_authorize(ENV['ADMIN_USERNAME'], ENV['ADMIN_PASSWORD'])
    click_on "Admin"
    dropdown_menu = find('.dropdown-menu', text: "Dashboard")
    within(dropdown_menu) {click_on "Categories"}

    # On categories page
    expect(page).to have_content("Category Name")
    click_on "New Category"

    # On new category page
    fill_in "Name", with: "Soups"
    click_on "Create Category"

    # Should go back to categories page
    expect(page).to have_content("Category Name")
    soups_row = find('tr', text: "Soups")
    expect(soups_row).to have_content("0") # Category should be initialized with 0 items


    click_on "Admin"
    dropdown_menu = find('.dropdown-menu', text: "Dashboard")
    within(dropdown_menu) {click_on "Products"}

    # On products page
    expect(page).to have_content("Qty Remaining")
    click_on "New Product"

    # On new product page
    fill_in "Name", with: "Miso Ramen"
    select "Soups", :from => "product_category_id" # Select from a dropdown list
    fill_in "Quantity", with: "20"
    fill_in "Price", with: "10.99"
    click_on "Create Product"

    # Should go back to products page
    expect(page).to have_content("Qty Remaining")
    miso_ramen_row = find('tr', text: "Miso Ramen")
    expect(miso_ramen_row).to have_content("10.99")


  end

end
