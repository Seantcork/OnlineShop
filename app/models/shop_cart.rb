class ShopCart < ApplicationRecord
  validates :amount, :presence => true, numericality: { greater_than: 0 }
end
