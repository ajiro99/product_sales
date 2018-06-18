class StockingProduct < ApplicationRecord
  belongs_to :stocking
  belongs_to :product

  def product_name
    "#{stocking.purchase_date} / #{stocking.purchase_place} / #{stocking.product_type} / #{product.type} / #{product.name} / #{estimated_price.to_s(:delimited)}"
  end
end
