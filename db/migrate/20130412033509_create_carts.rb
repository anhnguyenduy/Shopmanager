class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.integer :product_id
      t.string :name_product
      t.integer :price_product
      t.integer :number_product

      t.timestamps
    end
    add_index :carts, :product_id
  end
end
