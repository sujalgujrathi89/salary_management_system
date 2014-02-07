class SalariesController < ApplicationController
  before_filter :authenticate_user!
  def index
    @user = User.new
    @salary = Salary.new
    @salary = @user.salary
  end
  
  def 
    @user = User.where(:id => params[:user_id]).first
    if @user.present?
      @salary = @user.salary.new(user_id: @user.id, total_salary: @user.basic_salary, month:  @user.generated_salary )
      if @salary.save
        redirect_to user_path
      else
        redirect_to users_path
      end 
    else
      flash[:error] = "User not present with Given Id"
      redirect_to users_path
    end
  end
end
