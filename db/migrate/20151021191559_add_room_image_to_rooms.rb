class AddRoomImageToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :room_image_id, :string
  end
end
