class RemoveEndTimeFromMeeting < ActiveRecord::Migration
  def change
    remove_column :meetings, :end_time, :string
  end
end
