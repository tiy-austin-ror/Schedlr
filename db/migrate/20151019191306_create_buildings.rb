class CreateBuildings < ActiveRecord::Migration
  def change
    create_table :buildings do |t|
      t.string :name
      t.string :street
      t.string :city
      t.string :state
      t.string :zip
      t.belongs_to :site, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
