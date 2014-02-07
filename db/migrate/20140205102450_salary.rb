class Salary < ActiveRecord::Migration
  def change 
    rename_column :salaries, :salary, :total_salary
    rename_column :salaries, :current_salary, :generated_salary
    add_column  :salaries, :month, :string
  end
end
