class StockingProductsDecorator < Draper::CollectionDecorator

  def sum_estimated_price
    "#{StockingProduct.sum(:estimated_price).to_s(:delimited)}（在庫あり：#{StockingProduct.with_stock(:在庫あり).sum(:estimated_price).to_s(:delimited)}）"
  end

  def stock_count
    "　ボディ在庫数：#{StockingProduct.body_in_stock.count}　レンズ在庫数：#{StockingProduct.lense_in_stock.count}"
  end
end
