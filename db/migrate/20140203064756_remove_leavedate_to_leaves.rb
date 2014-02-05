class RemoveLeavedateToLeaves < ActiveRecord::Migration
  def change
    remove_column :leaves, :leave_date, :datetime
  end
end
