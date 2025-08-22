class ProductsController < ApplicationController
  def index
    @products = Product.includes(:category).available
    @categories = Category.all
    
    if params[:category_id].present?
      @products = @products.where(category_id: params[:category_id])
    end
    
    if params[:search].present?
      @products = @products.where("name LIKE ? OR description LIKE ?", 
                                  "%#{params[:search]}%", "%#{params[:search]}%")
    end
    
    # @products = @products.page(params[:page] || 1).per(12)  # Pagination removed for now
  end

  def show
    @product = Product.find(params[:id])
    @cart_item = CartItem.new
  end
end
