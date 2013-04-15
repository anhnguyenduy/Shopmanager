class OrdersController < ApplicationController
	
	def new
		if Cart.count==0
			flash[:warning]="Your Cart is Empty"
			redirect_to carts_path
		else
		@order = Order.new
	end
	end

	def cancel
		redirect_to carts_path
	end

	def create
			@oder=Order.new(params[:order])
			
			@oder.user_id=current_user.id
			count=0
			price=0
			#@order.status = "new"

			Cart.all.each{|c| 
				count=count+c.number_product
				price=price+c.total_price


			}
			@oder.number_product=count
			@oder.total_price=price
			if @oder.save
				

				flash[:success]="Submit Ok"
		# tao oderdetail
			Cart.all.each do |c|
				@detail=Orderdetail.new
				@detail.order_id=@oder.id
				@detail.product_id=c.product_id
				@detail.price_product=c.price_product
				@detail.number_product=c.number_product
				@detail.total_price=c.total_price

				@detail.save
				end
				clear_cart
				redirect_to root_path
			else
				flash[:error]="Have error while save order"
				redirect_to new_order_path
			end
	end
	def index		  
		@orders=current_user.orders
	end
	def show
		@order=Order.find(params[:id])
		@details=Order.find(params[:id]).orderdetails	
		@total_price=0
		@details.all.each{|c| 
				@total_price=@total_price+c.total_price


			}			
	end

	def edit
		@order=Order.find(params[:id])	
	end

	def update
		@order=Order.find(params[:id])
		if @order.update_attributes(params[:order])
			redirect_to @order
		else
		 render 'edit'
		end
	end

end
