class StockingProductsController < ApplicationController
  def index
    @stocking_products = StockingProduct.all
  end
end
