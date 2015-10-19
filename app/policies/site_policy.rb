class SitePolicy < ApplicationPolicy
  attr_reader :user, :site

  def initialize(user, site)
    @user = user
    @room = site
  end

  def create?
    user.admin? or not post.published?
  end
end
