class AddEventCountToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :event_count, :integer, default: 0
  end
end
