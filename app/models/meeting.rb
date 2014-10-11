class Meeting < ActiveRecord::Base
  validates :location, presence: true
  validates :start_time, presence: true
  validates :date, presence: true
end
