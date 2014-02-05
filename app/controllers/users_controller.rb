class UsersController < ApplicationController
  before_filter :authenticate_user!
  def index
   	@users=User.all
  end

  def edit
    @user = User.where(:id=>params[:id]).first
    if @user.present?
    else
      flash[:error] = "user not present with ID"
    end
  end 

  def update
    @user = User.where(:id=>params[:id]).first
    if @user.update(params[:user].permit(:name, :address,:contact_no,:email))
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.where(:id=>params[:id]).first
    @user.destroy
    redirect_to users_path
  end

  def activate
    @user = User.where(:id=>params[:id]).first
    if @user.is_admin == nil
      @user.update_attribute(:is_admin, "false")
    else  
      @user.update_attribute(:is_admin, nil)
    end 
      redirect_to users_path
  end

  def add_leaves
    @user = User.where(:id=>params[:id]).first
    @leave = Leave.new()
  end

  def create_leaves
    @user = User.where(:id=>params[:id]).first
    @leave = @user.leaves.new(leaves_params)
    if @leave.save
        flash.now[:notice] = "leave created"
        redirect_to edit_user_path
     else
       redirect_to edit_user_path
      end 
  end
  def generate_salary
    
  end  
private
  def set_params
      params.require(:users).permit(:name, :address,:contact_no,:is_admin,:email,:password)
  end

  def leaves_params
    params.require(:leave).permit(:start_date,:end_date)
  end  
end
