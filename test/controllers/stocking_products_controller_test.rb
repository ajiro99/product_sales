require 'test_helper'

class StockingProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get stocking_products_index_url
    assert_response :success
  end

end
