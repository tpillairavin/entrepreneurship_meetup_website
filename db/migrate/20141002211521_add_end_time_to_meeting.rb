class AddEndTimeToMeeting < ActiveRecord::Migration
  def change
    add_column :meetings, :end_time, :string
  end
end
