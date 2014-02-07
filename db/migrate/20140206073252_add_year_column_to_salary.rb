class AddYearColumnToSalary < ActiveRecord::Migration
  def change
    add_column :salaries, :year, :integer
  end
end
