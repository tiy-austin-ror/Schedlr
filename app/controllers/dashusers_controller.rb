class DashusersController < ApplicationController
  before_filter :authenticate_user!
  before_filter do
    redirect_to root_path unless current_user
  end

  def index
    @events = current_user.company.events.limit(10).offset(10)
    # @events.order(:start_time).page params[:page]

  end

end
