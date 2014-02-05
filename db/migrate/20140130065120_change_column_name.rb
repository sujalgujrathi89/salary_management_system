class ChangeColumnName < ActiveRecord::Migration
  def change
  	rename_column :users, :salary, :basic_salary
  end
end
