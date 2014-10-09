class Goal < ActiveRecord::Base
  attr_accessible :goal_value, :title
  belongs_to :user
  has_many :moments
  
end


