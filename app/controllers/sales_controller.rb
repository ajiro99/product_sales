class SalesController < ApplicationController
  before_action :set_sale, only: [:show, :edit, :update, :destroy]

  # GET /sales
  # GET /sales.json
  def index
    @sales = Sale.all
  end

  # GET /sales/1
  # GET /sales/1.json
  def show
  end

  # GET /sales/new
  def new
    @sale = Sale.new
    3.times { @sale.sale_products.build }
  end

  # GET /sales/1/edit
  def edit
  end

  # POST /sales
  # POST /sales.json
  def create
    @sale = Sale.new(sale_params)

    respond_to do |format|
      if @sale.save
        update_stock(@sale)
        format.html { redirect_to @sale, notice: 'Sale was successfully created.' }
        format.json { render :show, status: :created, location: @sale }
      else
        format.html { render :new }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sales/1
  # PATCH/PUT /sales/1.json
  def update
    respond_to do |format|
      if @sale.update(update_sale_params)
        update_stock(@sale)
        format.html { redirect_to @sale, notice: 'Sale was successfully updated.' }
        format.json { render :show, status: :ok, location: @sale }
      else
        format.html { render :edit }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales/1
  # DELETE /sales/1.json
  def destroy
    @sale.destroy
    respond_to do |format|
      format.html { redirect_to sales_url, notice: 'Sale was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale
      @sale = Sale.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sale_params
      params.require(:sale).
        permit(:sales_date, :product_type, :stocking_price, :bonus_price, :cost,
          :selling_price, :fee, :shipping_cost, :sales, :profit, :profit_rate, :status, :remarks,
          sale_products_attributes: [:stocking_product_id]
        )
    end

    def update_sale_params
      params.require(:sale).
        permit(:sales_date, :product_type, :stocking_price, :bonus_price, :cost,
          :selling_price, :fee, :shipping_cost, :sales, :profit, :profit_rate, :status, :remarks,
          sale_products_attributes: [:stocking_product_id, :_destroy, :id]
        )
    end

    def update_stock(sale)
      return unless @sale.status.売り切れ?
      stocking_products = sale.sale_products.map { |sale_product| sale_product&.stocking_product&.id}
      StockingProduct.where(id: stocking_products).update_all(stock: 0)
    end
end
