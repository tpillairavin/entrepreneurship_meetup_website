class Meeting < ActiveRecord::Base
  has_and_belongs_to_many :entrepreneurs

  validates :location, presence: true
  validates :start_time, presence: true
  validates :date, presence: true
end
