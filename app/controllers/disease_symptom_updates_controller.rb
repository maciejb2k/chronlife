class DiseaseSymptomUpdatesController < BaseController
  before_action :set_disease_symptom
  before_action :set_disease_symptom_update, only: %i[destroy]

  def create
    @disease_symptom_update = @disease_symptom.updates.build(disease_symptom_update_params)

    respond_to do |format|
      if @disease_symptom_update.save
        format.html do
          redirect_to [@disease, @disease_symptom],
                      notice: "Poprawnie dodano nowy status objawu."
        end
      else
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(
            @disease_symptom_update,
            partial: "disease_symptom_updates/form"
          )
        end
        format.html do
          redirect_to [@disease, @disease_symptom],
                      status: :unprocessable_entity
        end
      end
    end
  end

  def destroy
    @disease_symptom_update.destroy

    respond_to do |format|
      format.html do
        redirect_to [@disease, @disease_symptom],
                    notice: "Poprawnie usunięto status objawu."
      end
    end
  end

  private

  def set_disease_symptom
    @disease = current_user.account.diseases.find(params[:disease_id])
    @disease_symptom = @disease.symptoms.find(params[:disease_symptom_id])
  end

  def set_disease_symptom_update
    @disease_symptom_update = @disease_symptom.updates.find(params[:id])
  end

  def disease_symptom_update_params
    params.require(:disease_symptom_update).permit(:intensity, :update_date)
  end
end
