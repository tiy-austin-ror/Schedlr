class Event < ActiveRecord::Base
  belongs_to :room
  belongs_to :user
  has_many :invitees
  has_many :attendees
end
