class CartItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cart_item, only: [:destroy, :update]
  
  def index
    @cart_items = current_user.cart_items.includes(:product)
    @total = @cart_items.sum { |item| item.total_price }
  end

  def create
    @product = Product.find(params[:product_id])
    @cart_item = current_user.cart_items.find_by(product: @product)
    
    if @cart_item
      @cart_item.quantity += params[:cart_item][:quantity].to_i
    else
      @cart_item = current_user.cart_items.build(cart_item_params)
      @cart_item.product = @product
    end
    
    if @cart_item.save
      redirect_to cart_items_path, notice: 'Item added to cart successfully.'
    else
      redirect_to product_path(@product), alert: 'Failed to add item to cart.'
    end
  end
  
  def update
    if @cart_item.update(cart_item_params)
      redirect_to cart_items_path, notice: 'Cart updated successfully.'
    else
      redirect_to cart_items_path, alert: 'Failed to update cart.'
    end
  end

  def destroy
    @cart_item.destroy
    redirect_to cart_items_path, notice: 'Item removed from cart.'
  end
  
  private
  
  def set_cart_item
    @cart_item = current_user.cart_items.find(params[:id])
  end
  
  def cart_item_params
    params.require(:cart_item).permit(:quantity)
  end
end
