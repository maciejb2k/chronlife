class TreatmentDiseasesController < BaseController
  layout "dashboard"

  before_action :set_treatment
  before_action :set_diseases, only: %i[new create]
  before_action :set_treatment_disease, only: %i[destroy]

  before_action :set_breadcrumbs
  before_action :set_breadcrumbs_new, only: %i[new create]

  def new
    @treatment_disease = TreatmentDisease.new
  end

  def create
    @treatment_disease = @treatment.treatment_diseases.build(treatment_disease_params)

    respond_to do |format|
      if @treatment_disease.save
        format.html do
          redirect_to treatment_url(@treatment),
                      notice: "Choroba została poprawnie przypisana do terapii."
        end
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @treatment_disease.destroy

    respond_to do |format|
      format.html do
        redirect_to treatment_url(@treatment),
                    notice: "Choroba została poprawnie usunięta z terapii."
      end
    end
  end

  private

  def treatment_disease_params
    params.require(:treatment_disease).permit(:disease_id)
  end

  def set_treatment
    @treatment = current_account.treatments.find(params[:treatment_id])
  end

  def set_treatment_disease
    @treatment_disease = @treatment.treatment_diseases.find(params[:id])
  end

  def set_diseases
    @diseases = current_account.diseases.all.map { |d| [d.predefined_disease.name, d.id] }
  end

  def set_breadcrumbs
    add_breadcrumb("home", authenticated_root_path)
    add_breadcrumb("choroby", diseases_path)
    add_breadcrumb(@treatment.title, treatment_path(@treatment))
  end

  def set_breadcrumbs_new
    add_breadcrumb("przypisz chorobę", new_treatment_treatment_disease_path)
  end
end
