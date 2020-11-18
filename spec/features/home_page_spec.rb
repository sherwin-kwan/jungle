require "rails_helper"

RSpec.feature "Visitor navigates to home page", type: :feature, js: true do

  # SETUP
  before :all do
    load "#{Rails.root}/db/seeds.rb"
  end

  scenario "They see all products and products with 0 quantity have sold out tag" do
    # ACT
    visit root_path

    # DEBUG
    save_screenshot

    # VERIFY
    expect(page).to have_css "article.product", count: 7
    ice_cream = find("article.product", text: "Ice Cream")
    expect(ice_cream).to have_content("SOLD OUT")
  end
end
