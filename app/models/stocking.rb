class Stocking < ApplicationRecord
  has_many :stocking_products
  accepts_nested_attributes_for :stocking_products, allow_destroy: true, reject_if: :all_blank

  extend Enumerize
  enumerize :product_type, in: { レンズキット: 1, ボディ: 2, レンズ: 3, その他:0 }, scope: true
  enumerize :payment_type, in: { Yahooカード: 1, P_One: 2, Amex: 3, 現金:0 }, scope: true
  enumerize :purchase_place, in: { ヤフオク: 1, メルカリ: 2, ソフマップ: 20, ハードオフ:21, アキバU_shop:22 }, scope: true

  def set_purchasing_cost
    self.purchasing_cost = purchase_price + shipping_cost - use_points
  end
end
