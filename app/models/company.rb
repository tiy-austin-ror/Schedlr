class Company < ActiveRecord::Base
  has_many :sites
  has_many :users
  has_many :buildings, through: :sites
  has_many :rooms, through: :buildings
  has_many :attendees, through: :users
  has_many :events, through: :rooms
end
