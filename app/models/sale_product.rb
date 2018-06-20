class SaleProduct < ApplicationRecord
  belongs_to :sale
  belongs_to :stocking_product
end
