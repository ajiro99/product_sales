class StockingProductDecorator < Draper::Decorator
  delegate_all

  def stock_decorate
    h.content_tag(:font, stock, color: 'red') if stock.在庫あり?
  end
end
