class AddAttendeeCountToUser < ActiveRecord::Migration
  def change
    add_column :users, :attendees_count, :integer
  end
end
