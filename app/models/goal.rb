class Goal < ActiveRecord::Base
  attr_accessible :goal_value, :title
  belongs_to :user
  has_many :moments

  # Internal: Determine the difference in time between Time.now and when last moment was created
  #
  # self.moments - the Array of Moments belonging to a particular Goal
  #
  # Example:
  #
  # goal_object.seconds_since_last_moment_created
  # => 145003
  #
  # Returns the seconds since a moment was created for a goal
  def seconds_since_last_moment_created
    Time.now - self.moments.last.created_at    
  end
  
  def time_since
    self.check_time / 60
  end

  # Internal: Determines whether user needs an email notification of goal inactivity and sends email if too much time has lapsed; checks every Goal for a User
  #
  # time_in_seconds - the maximum amount of seconds to pass since creation of Moment for a Goal
  #
  # Example:
  #
  # Goal.check_for_laziness
  # => [#<Goal id: 2, title: "goal 2", goal_value: 500, user_id: nil, completed: nil, created_at: "2014-10-08 17:20:33", updated_at: "2014-10-08 17:20:33">,
 #<Goal id: 1, title: "goal 1", goal_value: 25, user_id: 1, completed: nil, created_at: "2014-10-08 17:01:45", updated_at: "2014-10-08 20:59:19">]
 #
 # Returns an Array of a table Goal objects that will receive email reminders
  def self.check_for_laziness(time_in_seconds)
    goals = Goal.all
    email_list=[]
    goals.each do |g|
      user = User.find_by_id(g.user_id)
      if g.moments.length >= 1
        if g.seconds_since_last_moment_created > time_in_seconds
          TrackerMailer.delay.reminder(user)
          email_list << g
        end
      end
    end
    return email_list
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

