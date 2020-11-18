require "rails_helper"

RSpec.feature "ProductDetails", type: :feature, js:true do

  # SETUP
  before :all do
    load "#{Rails.root}/db/seeds.rb"
  end

  scenario 'should be able to navigate to product details' do
    visit root_path

    click_on "Takoyaki"

    expect(page).to have_text '82'
    expect(page).to have_selector 'article.product-detail'
    expect(page).to have_button 'Add to Order'
  end
end
