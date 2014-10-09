class Goal < ActiveRecord::Base
  attr_accessible :goal_value, :title
  belongs_to :user
  has_many :moments
  
  def sum_of_moments
    moments_records=self.moments
    moments_records.inject{|sum,m| sum + m.moment_value }
  end
  
end


