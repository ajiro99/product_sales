class StockingProductsController < ApplicationController
  def index
    stocking_products = StockingProduct.all
    @stocking_products = StockingProductDecorator.decorate_collection(stocking_products)
  end
end
