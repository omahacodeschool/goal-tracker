class Goal < ActiveRecord::Base
  attr_accessible :completed, :goal_value, :title
  belongs_to :user
  has_many :moments
  
end


