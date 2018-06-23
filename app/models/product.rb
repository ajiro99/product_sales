class Product < ApplicationRecord
  has_many :stocking_products

  extend Enumerize
  enumerize :maker, in: { CANON: 1, NICON: 2, OLYMPUS: 3, SIGMA: 4 }, scope: true
  enumerize :color, in: { BLACK: 1, WHITE: 2, SILVER: 3 }, scope: true

  def product_name
    "#{maker} / #{name} / #{color}"
  end
end
