require "rails_helper"

RSpec.feature "Visitor navigates to home page", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: "Apparel"
    load "#{Rails.root}/db/seeds.rb"
  end

  scenario "They see all products" do
    # ACT
    visit root_path

    # DEBUG
    save_screenshot

    # VERIFY
    expect(page).to have_css "article.product", count: 7
  end
end
