class Sale < ApplicationRecord
  has_many :sale_products
  accepts_nested_attributes_for :sale_products, allow_destroy: true, reject_if: :all_blank

  extend Enumerize
  enumerize :product_type, in: { レンズキット: 1, ボディ: 2, レンズ: 3, その他:0 }, scope: true
  enumerize :status, in: { 販売予定: 1, 販売中: 2, 一時停止: 3, 売り切れ: 4, 削除:0 }, scope: true

  def maker
    sale_products.first&.product&.maker
  end

  def product_name
    sale_products.map { |sale_product| sale_product&.product&.name}.join(' / ')
  end
end
