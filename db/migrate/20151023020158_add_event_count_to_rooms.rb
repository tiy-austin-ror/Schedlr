class AddEventCountToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :events_count, :integer
  end
end
