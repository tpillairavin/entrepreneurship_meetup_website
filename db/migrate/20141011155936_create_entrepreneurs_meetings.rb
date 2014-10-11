class CreateEntrepreneursMeetings < ActiveRecord::Migration
  def self.up
    create_table :entrepreneurs_meetings, :id => false do |t|
      t.integer :entrepreneur_id
      t.integer :meeting_id
    end
  end

  def self.down
    drop_table :entrepreneurs_meetings
  end
end
