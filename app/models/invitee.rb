class Invitee < ActiveRecord::Base
  paginates_per 5
  belongs_to :user
  belongs_to :event
end
