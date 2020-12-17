# frozen_string_literal: true

class CategoriesController < ApplicationController
  def show
    # SELECT * FROM categories WHERE id = $1, [params[:id]]
    @category = Category.find(params[:id])
    # SELECT * FROM products JOIN categories ON products.category_id = categories.id ORDER BY products.created_at DESC
    @products = @category.products.order(created_at: :desc)
  end
end
