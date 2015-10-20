class DashboardController < ApplicationController
  before_filter :authenticate_user!
  before_filter do
    redirect_to root_path unless current_user && current_user.admin?
  end

  def index
    @rooms = Room.all
    @invitees = Invitee.all
    @events = Event.all
  end


end
