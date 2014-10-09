class Goal < ActiveRecord::Base
  attr_accessible :completed, :goal_value, :title, :user_id
  belongs_to :user
  has_many :moments
  
  def sum_of_moments
    moments_records=self.moments
    moments_records.inject{|sum,m| sum + m.moment_value }
  end
  
end


