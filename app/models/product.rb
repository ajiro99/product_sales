class Product < ApplicationRecord
  extend Enumerize
  enumerize :maker, in: { canon: 1, nicon: 2, olympus: 3 }, scope: true
  enumerize :color, in: { black: 1, white: 2, silver: 3 }, scope: true
end
