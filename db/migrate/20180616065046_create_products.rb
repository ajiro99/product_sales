class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :type
      t.integer :maker
      t.string :name
      t.integer :color

      t.timestamps
    end
  end
end
