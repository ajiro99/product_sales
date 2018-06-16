class StockingProduct < ApplicationRecord
  belongs_to :stocking
  belongs_to :product
end
