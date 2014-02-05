class AddDateColumnToLeaves < ActiveRecord::Migration
  def change
    add_column :leaves, :leave_date, :datetime
  end
end
