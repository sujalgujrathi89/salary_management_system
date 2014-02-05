class RemoveColumnFromLeaves < ActiveRecord::Migration
  def change
    remove_column :leaves, :month, :integer
    remove_column :leaves, :year, :integer
  end
end
