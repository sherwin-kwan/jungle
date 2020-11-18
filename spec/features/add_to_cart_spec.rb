require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
  
  # SETUP SEEDS
  before :all do
    load "#{Rails.root}/db/seeds.rb"
  end

  scenario 'should be able to add items to cart' do
    visit root_path

    puts page.html

    expect(page).to have_text('My Order (0)')

    first_item = find("article.product", match: :first)
    within(first_item) {click_on "Add"}

    save_screenshot
    expect(page).to have_text('My Order (1)')

  end
end
