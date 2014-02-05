class AddStartDateColumnToLeaves < ActiveRecord::Migration
  def change
    add_column :leaves, :start_date, :datetime
    add_column :leaves, :end_date, :datetime
  end
end
