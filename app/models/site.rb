class Site < ActiveRecord::Base
  paginates_per 8
  belongs_to :company
  has_many :buildings
  has_many :rooms, through: :buildings
  has_many :events, through: :rooms
  has_many :attendees, through: :events
end
