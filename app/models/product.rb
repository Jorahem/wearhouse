class Product < ApplicationRecord
  belongs_to :category
  has_many :cart_items, dependent: :destroy
  has_many :order_items, dependent: :destroy
  
  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :stock_quantity, presence: true, numericality: { greater_than_or_equal_to: 0 }
  
  scope :available, -> { where('stock_quantity > 0') }
  
  def in_stock?
    stock_quantity > 0
  end
end
