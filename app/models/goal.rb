class Goal < ActiveRecord::Base
  attr_accessible :completed, :goal_value, :title, :user_id
  belongs_to :user
  has_many :moments
  
end


