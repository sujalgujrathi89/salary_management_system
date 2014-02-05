class AddColumnToLeave < ActiveRecord::Migration
  def change
    add_column :leaves, :month, :integer
    add_column :leaves, :year, :integer
  end
end
