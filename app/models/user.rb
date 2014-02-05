class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,:validatable, :confirmable

  has_one  :salary
  has_many :leaves, class_name: "Leave" , dependent: :destroy
 # accepts_nested_attributes_for :leaves, allow_destroy: true

  validates :name, presence: true
  
  def is_admin?
    return self.is_admin
  end

  def leave_count
    
    @user=User.where(:id=>params[:id]).first
    @user.leaves each do |leave|
      leave.start_date=Leave.start_date.strftime("%Y-%m-%d")
      leave.end_date=Leave.end_date.strftime("%Y-%m-%d")
      st_date = Date.parse(leave.start_date)
      ed_date = Date.parse(leave.end_date)
      leave_diff = ed_date - st_date.to_i
      leaves_count = 0
      leaves_count = leaves_count + leave_diff
    end
    salary = @user.basic_salary
    one_day_sal = salary/30
    dec_on_sal = one_day_sal * leave_count
    current_salary = salary - dec_on_sal
  end 
end
