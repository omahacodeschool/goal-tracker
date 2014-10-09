class Moment < ActiveRecord::Base
  attr_accessible :moment_value, :goal_id
  belongs_to :goal
  validates :moment_value, presence: true
  
  def sum(moments)
    moments.each do |m|
      sum += m.moment_value
    end
    sum
  end
  
end
