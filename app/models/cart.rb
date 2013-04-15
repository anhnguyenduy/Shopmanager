class Cart < ActiveRecord::Base
 # attr_accessible  :number_product
  belongs_to :product, dependent: :destroy 
  attr_accessible :name_product, :number_product, :price_product, :product_id, :total_price
 

 

  private 
  def get_total_price
  	self.total_price=self.price_product*number_product
  	
  end
 
end
