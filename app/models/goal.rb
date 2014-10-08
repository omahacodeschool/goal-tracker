class Goal < ActiveRecord::Base
  attr_accessible :completed, :goal_value, :title, :user_id
end
