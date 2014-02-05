class AddAttributeToUser < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :contact_no, :integer
    add_column :users, :address, :string
    add_column :users, :is_admin, :boolean
  end
end
