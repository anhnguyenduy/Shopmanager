class MainPagesController < ApplicationController
  def home
  	@categories=Category.all
  	#@products=Product.paginate(page: params[:page])
  end
end
