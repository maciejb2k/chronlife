class TreatmentUpdatesController < ApplicationController
  before_action :set_treatment_update, only: %i[ show edit update destroy ]

  # GET /treatment_updates or /treatment_updates.json
  def index
    @treatment_updates = TreatmentUpdate.all
  end

  # GET /treatment_updates/1 or /treatment_updates/1.json
  def show
  end

  # GET /treatment_updates/new
  def new
    @treatment_update = TreatmentUpdate.new
  end

  # GET /treatment_updates/1/edit
  def edit
  end

  # POST /treatment_updates or /treatment_updates.json
  def create
    @treatment_update = TreatmentUpdate.new(treatment_update_params)

    respond_to do |format|
      if @treatment_update.save
        format.html { redirect_to treatment_update_url(@treatment_update), notice: "Treatment update was successfully created." }
        format.json { render :show, status: :created, location: @treatment_update }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @treatment_update.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /treatment_updates/1 or /treatment_updates/1.json
  def update
    respond_to do |format|
      if @treatment_update.update(treatment_update_params)
        format.html { redirect_to treatment_update_url(@treatment_update), notice: "Treatment update was successfully updated." }
        format.json { render :show, status: :ok, location: @treatment_update }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @treatment_update.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /treatment_updates/1 or /treatment_updates/1.json
  def destroy
    @treatment_update.destroy

    respond_to do |format|
      format.html { redirect_to treatment_updates_url, notice: "Treatment update was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_treatment_update
      @treatment_update = TreatmentUpdate.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def treatment_update_params
      params.require(:treatment_update).permit(:name, :status, :description, :update_date, :treatment_id)
    end
end
