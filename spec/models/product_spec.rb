# frozen_string_literal: true

require "rails_helper"

describe Product, type: :model do
  # # METHOD 1
  # category = Category.create(name: "Maki")
  # my_product = category.products.create(name: "California Rolls", price: 10, desc ....)

  # # METHOD 2
  # category = Category.create(name: "Maki")
  # my_product = Product.create(name: "California Rolls", price: 10, category_id: category.id, desc ....)

  # # METHOD 3
  # category = Category.create(name: "Maki")
  # my_product = Product.create(name: "California Rolls", price: 10, category: category, desc ....)

  it "successfullies save a new product if all required fields are there" do
    category = Category.create(name: "Maki")
    my_product = category.products.create(name: "California Rolls", price: 10,
                                          description: "Maki rolls with avocado and imitation crab", quantity: 30)
    expect(my_product.persisted?).to be(true)
    expect(my_product.errors.full_messages[0]).to be_nil
  end

  describe "Validations" do
    # validation tests/examples here

    it "fails to save if the name is missing" do
      category = Category.create(name: "Maki")
      product = described_class.create(name: nil, price: 10, description: "Maki rolls with avocado and imitation crab", quantity: 30,
                                       category: category)
      expect(product.persisted?).to be(false)
      expect(product.errors.full_messages[0]).to be_truthy
    end

    it "fails to save if the price is missing" do
      category = Category.create(name: "Maki")
      product = described_class.create(name: "California Rolls", price: nil, description: "Maki rolls with avocado and imitation crab", quantity: 30,
                                       category: category)
      expect(product.persisted?).to be(false)
      expect(product.errors.full_messages[0]).to be_truthy
    end

    it "fails to save if the quantity is missing" do
      category = Category.create(name: "Maki")
      product = described_class.create(name: "California Rolls", price: 10, description: "Maki rolls with avocado and imitation crab", quantity: nil,
                                       category: category)
      expect(product.persisted?).to be(false)
      expect(product.errors.full_messages[0]).to be_truthy
    end

    it "fails to save if the category is missing" do
      category = Category.create(name: "Maki")
      product = described_class.create(name: "California Rolls", price: 10,
                                       description: "Maki rolls with avocado and imitation crab", quantity: 30)
      expect(product.persisted?).to be(false)
      expect(product.errors.full_messages[0]).to be_truthy
    end
  end
end
