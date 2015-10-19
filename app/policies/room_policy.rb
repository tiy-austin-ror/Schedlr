class RoomPolicy < ApplicationPolicy
  attr_reader :user, :room

  def initialize(user, room)
    @user = user
    @room = room
  end

  def create?
    user.admin? or not post.published?
  end
end
