# frozen_string_literal: true


# Controller class to display products (dishes)
class ProductsController < ApplicationController
  def index
    @products = ApplicationHelper.shuffle(Product.all.to_a)
    @categories = Category.select(:id, :name)
  end

  def show
    @product = Product.find params[:id]
  end

end
