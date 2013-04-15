class Orderdetail < ActiveRecord::Base
  #attr_accessible :number_product, :order_id, :price_product, :product_id, :total_price
  attr_accessible :number_product, :price_product, :product_id, :total_price
  belongs_to :order
 
end
