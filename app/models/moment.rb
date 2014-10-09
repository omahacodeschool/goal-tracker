class Moment < ActiveRecord::Base
  attr_accessible :moment_value
  belongs_to :goal
end
