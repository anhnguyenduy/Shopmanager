class UsersController < ApplicationController
	before_filter :sign_in_user , only:[:show,:destroy,:edit,:update]


	def index
		@users=User.paginate(page: params[:page])
		
	end

	def new
  	@user = User.new
  end
 

	def create
		@user=User.create(params[:user])
		if @user.save
			sign_in @user
			flash[:success] = "New Acount Created!"
			redirect_to @user
		else
			
			render 'new'
		end
	end

	def destroy
		user=User.find(params[:id]).destroy
		flash[:success]="Deleted #{user.name}"
		redirect_to users_url

		
	end

	def edit
		@user=User.find(params[:id])


		
	end


	def show
		@user=User.find(params[:id])
	end

	def update
		@user=User.find(params[:id])
		if @user.update_attributes(params[:user])
			sign_in @user
			flash[:sucess] = "Update Profile Success!"
			redirect_to current_user
		else

		render 'edit'
		end
			
	end


	

	def  correct_user
		@user=User.find(params[:id])
		redirect_to root_path, notice:"Ban khong duoc sua tai khoan cua nguoi khac" unless current_user?(@user)
	
		
	end

	def user_admin
		redirect_to root_path unless current_user.admin?
		
	end
end
