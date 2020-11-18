class Admin::SalesController < Admin::BaseController
  def index
    @sales = Sale.all
  end

  def new

  end

  def create
    
  end
end
