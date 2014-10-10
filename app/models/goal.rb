class Goal < ActiveRecord::Base
  attr_accessible :goal_value, :title
  belongs_to :user
  has_many :moments


  # returns 1400
  def check_time
    Time.now - self.moments.last.created_at    
  end
  
  def self.check_for_laziness
    goals = Goal.all
    goals.each do |g|
      user = User.find_by_id(g.user_id)
      binding.pry
      if g.moments.length >= 1
        if g.check_time > 300
          TrackerMailer.delay.welcome(user)
        end
      else
        puts "no mail"
      end
    end
  end
  
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

