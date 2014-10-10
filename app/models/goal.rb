class Goal < ActiveRecord::Base
  attr_accessible :completed, :goal_value, :title, :user_id
  belongs_to :user
  has_many :moments
  
  def goal_reached?(goal)
    if goal.moments.sum(:moment_value) >= goal.goal_value
      true
    else
      false
    end
  end
  
  def goal_completed?(goal)
    if goal_reached?(goal)
      goal.completed = true
    else
      goal.completed = false
    end
  end
  
end


