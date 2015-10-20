class AddDefaultToInvitees < ActiveRecord::Migration
  def change
    change_column :invitees, :accepted, :boolean, default: false
  end
end
