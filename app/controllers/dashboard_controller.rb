class DashboardController < ApplicationController
  before_filter :authenticate_user!
  before_filter do
    redirect_to root_path unless current_user && current_user.admin?
  end

  def index
    @rooms = current_user.company.rooms.order(:name).page params[:page_rooms]
    @events = current_user.company.events.order(:start_time).page params[:page_events]
    @invitees = current_user.company.invitees.order(:event_id).page params[:page_invitees]
  end
end
