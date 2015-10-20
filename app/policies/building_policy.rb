class BuildingPolicy < ApplicationPolicy
  attr_reader :user, :building

  def initialize(user, building)
    @user = user
    @building = building
  end

  def create?
    user.admin?
  end
end
