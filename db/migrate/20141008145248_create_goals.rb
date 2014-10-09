class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :title
      t.integer :goal_value
      t.integer :user_id
      t.boolean :completed

      t.timestamps
    end
  end
end
