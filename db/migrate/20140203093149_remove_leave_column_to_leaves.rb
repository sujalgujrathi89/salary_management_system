class RemoveLeaveColumnToLeaves < ActiveRecord::Migration
  def change
    remove_column :leaves, :leave, :integer
  end
end
