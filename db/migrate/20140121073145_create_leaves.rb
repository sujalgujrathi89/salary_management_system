class CreateLeaves < ActiveRecord::Migration
  def change
    create_table :leaves do |t|
      t.integer :leave
      t.integer :user_id

      t.timestamps
    end
  end
end
