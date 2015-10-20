class RoomPolicy < ApplicationPolicy
  attr_reader :user, :room

  def initialize(user, room)
    @user = user
    @room = room
  end

  def index?
    user.admin? && user.company.id == room.building.site.company.id
  end

  def create?
    user.admin? && user.company.id == room.building.site.company.id
  end
end
