# frozen_string_literal: true


# Controller class to display products (dishes)
class ProductsController < ApplicationController
  def index
    @products = ApplicationHelper.shuffle(Product.all.to_a)
    # SELECT id, name FROM categories;
    @categories = Category.select(:id, :name)
  end

  def show
    # SELECT * FROM products WHERE id = $1, [params[:id]]
    @product = Product.find params[:id]
  end

end
