class CreateInvitees < ActiveRecord::Migration
  def change
    create_table :invitees do |t|
      t.integer :event_id
      t.integer :user_id
      t.boolean :accepted

      t.timestamps null: false
    end
  end
end
