class Moment < ActiveRecord::Base
  attr_accessible :moment_value
  belongs_to :goal
  validates :moment_value, presence: true
end
