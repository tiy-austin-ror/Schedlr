class Room < ActiveRecord::Base
  paginates_per 8
  belongs_to :building
  has_many :events
  has_many :attendees, through: :events
  has_many :invitees, through: :invitees
  attachment :room_image
end
