class DiseaseSymptomUpdatesController < BaseController
  before_action :set_disease_symptom_update, only: %i[show edit update destroy]

  # GET /disease_symptom_updates or /disease_symptom_updates.json
  def index
    @disease_symptom_updates = DiseaseSymptomUpdate.all
  end

  # GET /disease_symptom_updates/1 or /disease_symptom_updates/1.json
  def show; end

  # GET /disease_symptom_updates/new
  def new
    @disease_symptom_update = DiseaseSymptomUpdate.new
  end

  # GET /disease_symptom_updates/1/edit
  def edit; end

  # POST /disease_symptom_updates or /disease_symptom_updates.json
  def create
    @disease_symptom_update = DiseaseSymptomUpdate.new(disease_symptom_update_params)

    respond_to do |format|
      if @disease_symptom_update.save
        format.html do
          redirect_to disease_symptom_update_url(@disease_symptom_update),
                      notice: "Disease symptom update was successfully created."
        end
        format.json { render :show, status: :created, location: @disease_symptom_update }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @disease_symptom_update.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /disease_symptom_updates/1 or /disease_symptom_updates/1.json
  def update
    respond_to do |format|
      if @disease_symptom_update.update(disease_symptom_update_params)
        format.html do
          redirect_to disease_symptom_update_url(@disease_symptom_update),
                      notice: "Disease symptom update was successfully updated."
        end
        format.json { render :show, status: :ok, location: @disease_symptom_update }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @disease_symptom_update.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /disease_symptom_updates/1 or /disease_symptom_updates/1.json
  def destroy
    @disease_symptom_update.destroy

    respond_to do |format|
      format.html do
        redirect_to disease_symptom_updates_url,
                    notice: "Disease symptom update was successfully destroyed."
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_disease_symptom_update
    @disease_symptom_update = DiseaseSymptomUpdate.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def disease_symptom_update_params
    params.require(:disease_symptom_update).permit(:intensity, :update_date, :disease_symptom_id)
  end
end
