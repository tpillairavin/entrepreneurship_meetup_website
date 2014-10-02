class AddStartTimeToMeetings < ActiveRecord::Migration
  def change
    add_column :meetings, :start_time, :string
  end
end
