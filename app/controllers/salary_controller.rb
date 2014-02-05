class SalaryController < ApplicationController

def index
	@user = User.new
	@salary=Salary.new
	@salaries = @user.salary.all
end

end
