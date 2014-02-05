class AddSalToUser < ActiveRecord::Migration
  def change
    add_column :users, :salary, :integer
  end
end
