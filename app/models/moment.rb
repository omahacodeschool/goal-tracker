class Moment < ActiveRecord::Base
  attr_accessible :goal_id, :moment_value
  belongs_to :goal
end
