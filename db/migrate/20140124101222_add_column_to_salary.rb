class AddColumnToSalary < ActiveRecord::Migration
  def change
    add_column :salaries, :current_salary, :integer
  end
end
