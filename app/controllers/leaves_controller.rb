class LeavesController < ApplicationController

  def new
  	 @user = User.new
    @leave = Leave.new
  end

  def index
  	@user = User.where(:id=>params[:user_id]).first
  	@leave = @user.leaves
  	#@leave =Leave.where(:user_id=>params[:user_id])
  end

  def create
  	@user = User.where(:id => params[:user_id]).first
    @leave =@user.leaves.new(leaves_params)
    if @leave.save
	    flash.now[:notice] = "leave created"
	    redirect_to users_path
    else
        redirect_to edit_user_path
    end 
  end

  def edit
  	 @user = User.where(:id => params[:user_id]).first
  	 @leave =@user.leaves.where(:id=>params[:id]).first
  end 	
  	
   def update
   	  @user = User.where(:id => params[:user_id]).first
   	  @leave = @user.leaves.where(:id=>params[:id]).first
  	  if @leave.update(leaves_params)
  	  	redirect_to user_leaves_path(params[:user_id])
  	  else
  	    render 'edit'
  	  end   	
   end

  def destroy
	@leave = Leave.where(:id=>params[:id]).first
    @leave.destroy
    redirect_to user_leaves_path
  end

  private
  def leaves_params
    params.require(:leave).permit(:start_date,:end_date)
  end    
end
