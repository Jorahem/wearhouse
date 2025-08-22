class HomeController < ApplicationController
  def index
    @featured_products = Product.includes(:category).available.limit(8)
    @categories = Category.all
  end
end
