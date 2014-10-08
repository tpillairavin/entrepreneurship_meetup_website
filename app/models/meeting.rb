class Meeting < ActiveRecord::Base
  validates :location, presence: true
  validates :start_time, presence: true
end
