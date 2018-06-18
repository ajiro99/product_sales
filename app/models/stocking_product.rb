class StockingProduct < ApplicationRecord
  belongs_to :stocking
  belongs_to :product

  extend Enumerize
  enumerize :stock, in: { 在庫あり: 1, 在庫なし:0 }, scope: true

  def product_name
    "#{stocking.purchase_date} / #{stocking.purchase_place} / #{stocking.product_type} / #{product.type} / #{product.name} / #{estimated_price.to_s(:delimited)}"
  end
end
