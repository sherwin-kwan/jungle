# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Visitor navigates to home page", type: :feature, js: true do
  # SETUP
  before :all do
    load "#{Rails.root}/db/seeds.rb"
  end

  it "They see all products" do
    # ACT
    visit root_path

    # DEBUG
    save_screenshot

    # VERIFY
    expect(page).to have_css "article.product", count: 7
  end
end
