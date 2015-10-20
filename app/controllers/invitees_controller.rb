class InviteesController < ApplicationController
  before_action :set_invitee, only: [:show, :edit, :update, :destroy]

  # GET /invitees
  def index
    @invitees = Invitee.all
  end

  # GET /invitees/1
  def show
  end

  # GET /invitees/new
  def new
    @invitee = Invitee.new
  end

  # GET /invitees/1/edit
  def edit
  end

  # POST /invitees
  def create
    @invitee = Invitee.new(invitee_params)

    if @invitee.save
      redirect_to :back, notice: 'Invitee was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /invitees/1
  def update
    if @invitee.update(invitee_params)
      redirect_to @invitee, notice: 'Invitee was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /invitees/1
  def destroy
    @invitee.destroy
    redirect_to invitees_url, notice: 'Invitee was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invitee
      @invitee = Invitee.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def invitee_params
      params.require(:invitee).permit(:event_id, :user_id)
    end
end
