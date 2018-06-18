class CreateSales < ActiveRecord::Migration[5.2]
  def change
    create_table :sales do |t|
      t.date :sales_date
      t.integer :product_type
      t.integer :stocking_price, default: 0
      t.integer :bonus_price, default: 0
      t.integer :cost, default: 0
      t.integer :selling_price, default: 0
      t.integer :fee, default: 0
      t.integer :shipping_cost, default: 0
      t.integer :sales, default: 0
      t.integer :profit, default: 0
      t.decimal :profit_rate, precision: 5, scale: 2, default: 0
      t.integer :status
      t.string :remarks

      t.timestamps
    end
  end
end