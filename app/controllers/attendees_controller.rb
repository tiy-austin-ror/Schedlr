class AttendeesController < ApplicationController

  def create
    @attendee = Attendee.new(attendee_params)
    @attendee.user_id = current_user.id

    Attendee.where(user_id: current_user.id).any? do |a|
      if a.event.event_range.overlaps?(@attendee.event.event_range)
        flash.alert = "You are already scheduled for an event at that time!"
        redirect_to event_path(params[:attendee][:event_id])and return
      end
    end

    respond_to do |format|
      if @attendee.save
        format.html { redirect_to :back, notice: 'attendee was successfully created.' }
        format.json { render :show, status: :created, location: @attendee }
      else
        format.html { render :new }
        format.json { render json: @attendee.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attendee
      @attendee = attendee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attendee_params
      params.require(:attendee).permit(:event_id, :user_id)
    end


end
