module SessionsHelper


def sign_in(user)
    cookies.permanent[:remember_token] = user.remember_token
    self.current_user = user
  end

 def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user ||= User.find_by_remember_token(cookies[:remember_token])
  end
   def signed_in?
    !current_user.nil?
  end

  def sign_out
    self.current_user = nil
    cookies.delete(:remember_token)
    cookies.delete(:remember_token_category)
    clear_cart
  end
  def current_user?(user)
  	current_user==user
  	
  end


  def redirect_back_or(default)
		redirect_to(session[:return_to] || default)
		session.delete(:return_to)
	end

	def store_location
		session[:return_to] = request.fullpath
	end

	def signed_in_user
		unless signed_in?
			store_location
			redirect_to root_ulr, notice: "Ban can dang nhap truoc!"
		end
		
	end
 def sign_in_user
    unless  signed_in?
      store_location
      redirect_to login_path, notice: "Vui long dang nhap truoc!" 
    end
  end

 def current_category=(category)
    cookies.permanent[:remember_token_category] = category.remember_token
    @current_category=Category.find_by_remember_token(cookies[:remember_token_category])
  end

   def current_category
    @current_category=Category.find_by_remember_token(cookies[:remember_token_category])
  end

  def set_categories=(categories)
    @categories=categories
    
  end
  def get_categories
    @categories
    
  end

  def  product_select=(product)
    @product_select=product


    
  end
  def product_selected
    @product_select
    
  end

  def  clear_cart
    Cart.all.each{|c| c.destroy}
    cookies.delete(:remember_product)
  end
  
end
