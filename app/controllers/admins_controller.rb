class AdminsController < ApplicationController

  def new
    @user=User.new
    @user.leaves.build
  end	

  def index
    @users=User.all	
  end

  def create
    @user = User.new(set_params)
    if @user.save
      redirect_to @user
    else
      render 'new'
    end  
  end

  private
  def set_params
	  params.require(:user).permit(:id, :name, :address, :contact_no, :is_admin, :email, :password, :password_confirmation, :is_active, :basic_salary)
  end

end
