class Building < ActiveRecord::Base
  paginates_per 8

  belongs_to :site
  has_many :rooms
  has_many :events, through: :rooms
  has_many :attendees, through: :events
end
