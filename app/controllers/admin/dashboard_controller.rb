class Admin::DashboardController < Admin::BaseController
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
    @products_table_array = ApplicationRecord.connection.execute(products_table_query)
  end
end
