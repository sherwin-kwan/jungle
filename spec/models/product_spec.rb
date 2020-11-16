require 'rails_helper'

describe Product, type: :model do

  it 'should successfully save a new product if all required fields are there' do
    category = Category.create(name: "Maki")
    my_product = category.products.create(name: "California Rolls", price: 10, description: "Maki rolls with avocado and imitation crab", quantity: 30)
    expect(my_product.persisted?).to be(true)
    expect(my_product.errors.full_messages[0]).to be_nil
  end

  describe 'Validations' do
    # validation tests/examples here

    it 'should fail to save if the name is missing' do
      category = Category.create(name: "Maki")
      product = Product.create(name: nil, price: 10, description: "Maki rolls with avocado and imitation crab", quantity: 30,
        category: category)
      expect(product.persisted?).to be(false)
      expect(product.errors.full_messages[0]).to be_truthy
    end

    it 'should fail to save if the price is missing' do
      category = Category.create(name: "Maki")
      product = Product.create(name: "California Rolls", price: nil, description: "Maki rolls with avocado and imitation crab", quantity: 30,
        category: category)
      expect(product.persisted?).to be(false)
      expect(product.errors.full_messages[0]).to be_truthy
    end

    it 'should fail to save if the quantity is missing' do
      category = Category.create(name: "Maki")
      product = Product.create(name: "California Rolls", price: 10, description: "Maki rolls with avocado and imitation crab", quantity: nil,
        category: category)
      expect(product.persisted?).to be(false)
      expect(product.errors.full_messages[0]).to be_truthy
    end

    it 'should fail to save if the category is missing' do
      category = Category.create(name: "Maki")
      product = Product.create(name: "California Rolls", price: 10, description: "Maki rolls with avocado and imitation crab", quantity: 30)
      expect(product.persisted?).to be(false)
      expect(product.errors.full_messages[0]).to be_truthy
    end
  end
end
