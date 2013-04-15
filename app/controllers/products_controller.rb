class ProductsController < ApplicationController
	before_filter :sign_in_user, only:[:new,:create,:destroy,:edit,:update]
	def new
		if cookies[:remember_token_category].nil?
		 category=(Category.find(params[:id]))
		 cookies.permanent[:remember_token_category] = category.remember_token
		end
		@product=Product.new
		
	end

	def create

		
		@product=current_category.products.build(params[:product])
		if @product.save
			flash[:sucess]="New Product Added to #{current_category.name}"
			redirect_to categories_url
		else
			render 'new'
		end	
		
	end
	def show
			@product=Product.find(params[:id])			
			cookies.permanent[:remember_product] = @product.id
	end

	def  edit
		@product=Product.find(params[:id])
	end


	def update
		@product=Product.find(params[:id])
		if @product.update_attributes(params[:product])
			flash[:sucess]="Product updated"
			redirect_to current_category
		else
			render 'edit'
		end
	end

	def  destroy
	Product.find(params[:id]).destroy
	flash[:sucess]="Deleted product"
	redirect_to current_category

		
	end
end
