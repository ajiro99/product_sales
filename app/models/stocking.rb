class Stocking < ApplicationRecord
  has_many :stocking_products
  accepts_nested_attributes_for :stocking_products, allow_destroy: true, reject_if: :all_blank

  extend Enumerize
  enumerize :product_type, in: { lense_kit: 1, body: 2, lense: 3, other:0 }, scope: true
  enumerize :payment_type, in: { yahoo: 1, p_one: 2, amex: 3, cash:0 }, scope: true
  enumerize :purchase_place, in: { yahoo_auctions: 1, mercari: 2, sofmap: 20, hard_off:21, akiba_u_shop:22 }, scope: true

  def set_purchasing_cost
    self.purchasing_cost = purchase_price + shipping_cost - use_points
  end
end
