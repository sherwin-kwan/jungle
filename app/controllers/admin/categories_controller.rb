class Admin::CategoriesController < ApplicationController
  def index
    @categories = Category.order(:name).all
  end

  def create
    @category = Category.new(params.require(:category).permit(:name))

    if @category.save # Relying on "return false" for errors
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render :new
    end

  end

  def new
    @category = Category.new
  end
end
