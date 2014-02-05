class CreateSalaries < ActiveRecord::Migration
  def change
    create_table :salaries do |t|

      t.integer :salary
      t.integer :user_id

      t.timestamps
    end
  end
end
