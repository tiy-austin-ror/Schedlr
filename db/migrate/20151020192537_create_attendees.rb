class CreateAttendees < ActiveRecord::Migration
  def change
    create_table :attendees do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :event, index: true, foreign_key: true
    end
  end
end
