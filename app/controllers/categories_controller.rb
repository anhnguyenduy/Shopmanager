class CategoriesController < ApplicationController
	before_filter :sign_in_user , only:[:edit,:create,:destroy,:update]
	def show
		@category=Category.find(params[:id])
		@products=@category.products.paginate(page: params[:page])
		cookies.permanent[:remember_token_category] = @category.remember_token
	end

	

	def  new
		@category=Category.new		
	end

	def create
		@category=Category.create(params[:category])
		if @category.save
			flash[:success]="New Category Added"
			redirect_to categories_path
		else
			render 'new'	
		end
	end

	def edit
	@category=Category.find(params[:id])
	cookies.permanent[:remember_token_category] = @category.remember_token


	 #@current_category=@category
	# create_current_category=(@category)

	end

	def update
		@category=Category.find(params[:id])
		if @category.update_attributes(params[:category])
			flash[:success] = "category Updated!"
			redirect_to categories_path
		else
			render 'edit'
		end
		
		
	end

	def  destroy
		category=Category.find(params[:id]).destroy
		flash[:success]="Deleted Category #{category.name}"
		redirect_to categories_path
		
	end

	def index
		@categories=Category.paginate(page: params[:page])
	end

end
