class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['ADMIN_USERNAME'], password: ENV['ADMIN_PASSWORD']

  def show
    @totals = {
      products: Product.count,
      categories: Category.count,
      orders: Order.count,
      products_purchased: LineItem.distinct(:product_id).count,
    }
    products_table_query = "SELECT products.id, products.name, COUNT(line_items.id)
      FROM line_items 
      JOIN products ON line_items.product_id = products.id
      GROUP BY products.id"
    @products_table_array = ActiveRecord::Base.connection.execute(products_table_query)
  end
end
