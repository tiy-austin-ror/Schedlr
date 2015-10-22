class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @events = Event.order(:start_time).page params[:page]
  end

  def reports
    @events = Event.all
    respond_to do |format|
      format.html
      format.csv { render text: @events.to_csv }
      format.pdf do
        render pdf: 'Events',
               template: 'dashboard/show.pdf.erb'
      end
    end
  end
  # GET /events/1
  # GET /events/1.json
  def show

  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    @event.user = current_user

    Event.where(room_id: params[:event][:room_id]).any? do |e|
      if e.event_range.overlaps?(@event.event_range)
        flash.alert = "An event is already scheduled for that time!"
        redirect_to room_path(params[:event][:room_id]) and return
      end
    end

    respond_to do |format|
      if @event.save
        UserMailer.room_confirm(current_user, @room).deliver_now
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:start_time, :duration, :description, :room_id, :user_id)
    end
end
