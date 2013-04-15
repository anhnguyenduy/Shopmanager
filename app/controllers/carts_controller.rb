class CartsController < ApplicationController
#	before_filter :signed_in_user , only:[:destroy,:new,:index]
	def index
		if !signed_in?
			flash[:notice]="Ban can dang nhap truoc"
			redirect_to Product.find(cookies[:remember_product])
		else
		@carts=Cart.all
		@sumary_price=0	
		@carts.each do |c|

			@sumary_price =@sumary_price + c.price_product
		end
	end
		
	end

	def new
		@product=Product.find(cookies[:remember_product])	
		add_item(@product)
		 redirect_to carts_path
		
		
	end

	def edit
		
	end

	def  update
		
	end
	def destroy
		Cart.find(params[:id]).destroy
		flash[:info]="One item removed"
		redirect_to carts_path
		
	end

	private 
	def create_cart_item(product)
		@cart=Cart.new

		
	end
private
	def add_item(product)
		id=product.id
		name=product.name
		price=product.cost
		count=1;
		total_price=price*count
		@cart=Cart.new(product_id: id, name_product: name, price_product: price, number_product: count, total_price: total_price)
		@cart.save

	end
end
