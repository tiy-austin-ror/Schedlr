class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :name
      t.integer :capacity
      t.belongs_to :building, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
