class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy
  
  validates :status, presence: true
  validates :total, presence: true, numericality: { greater_than: 0 }
  
  enum :status, { pending: 0, processing: 1, shipped: 2, delivered: 3, cancelled: 4 }
end
