class Room < ActiveRecord::Base
  belongs_to :building
  has_many :events
  has_many :attendees, through: :events
end
