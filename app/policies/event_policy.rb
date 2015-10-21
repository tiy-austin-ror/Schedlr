class EventPolicy < ApplicationPolicy
  attr_reader :user, :event

  def initialize(user, event)
    @user = user
    @event = event
  end

  def is_in_private_event?

  end
end
