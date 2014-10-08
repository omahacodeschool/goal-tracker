class CreateMoments < ActiveRecord::Migration
  def change
    create_table :moments do |t|
      t.integer :moment_value
      t.integer :goal_id

      t.timestamps
    end
  end
end
