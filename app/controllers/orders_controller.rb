class OrdersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @orders = current_user.orders.includes(:order_items => :product).order(created_at: :desc)
  end

  def show
    @order = current_user.orders.find(params[:id])
  end

  def create
    @cart_items = current_user.cart_items.includes(:product)
    
    if @cart_items.empty?
      redirect_to cart_items_path, alert: 'Your cart is empty.'
      return
    end
    
    @order = current_user.orders.build(
      total: @cart_items.sum { |item| item.total_price },
      status: :pending,
      shipping_address: params[:order][:shipping_address]
    )
    
    if @order.save
      @cart_items.each do |cart_item|
        @order.order_items.create!(
          product: cart_item.product,
          quantity: cart_item.quantity,
          price: cart_item.product.price
        )
        
        # Update stock quantity
        product = cart_item.product
        product.update!(stock_quantity: product.stock_quantity - cart_item.quantity)
      end
      
      # Clear cart
      current_user.cart_items.destroy_all
      
      redirect_to order_path(@order), notice: 'Order placed successfully!'
    else
      redirect_to cart_items_path, alert: 'Failed to place order.'
    end
  end
end
