class Moment < ActiveRecord::Base
  attr_accessible :moment_value, :goal_id
  belongs_to :goal
  validates :moment_value, presence: true
  
  def accumulating_value(moment)
    goal = moment.goal
    accum_value = goal.moments.sum(:moment_value)
    moment.update_column(:accum_value, accum_value)
    moment.save
  end
  
end
