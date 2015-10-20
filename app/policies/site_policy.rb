class SitePolicy < ApplicationPolicy
  attr_reader :user, :site

  def initialize(user, site)
    @user = user
    @site = site
  end

  def create?
    user.admin?
  end
end
