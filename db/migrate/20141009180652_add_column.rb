class AddColumn < ActiveRecord::Migration
  def up
    add_column :moments, :accum_value, :integer
  end

  def down
  end
end
