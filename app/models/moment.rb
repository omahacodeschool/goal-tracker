class Moment < ActiveRecord::Base
  attr_accessible :moment_value, :goal_id
  
  belongs_to :goal
end
