class CreateOrderdetails < ActiveRecord::Migration
  def change
    create_table :orderdetails do |t|
      t.integer :order_id
      t.integer :product_id
      t.integer :price_product
      t.integer :number_product
      t.integer :total_price

      t.timestamps
    end
  end
end
