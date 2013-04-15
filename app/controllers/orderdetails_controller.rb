class OrderdetailsController < ApplicationController
	def  new
		@detail=Orderdetail.new
		
	end
end
