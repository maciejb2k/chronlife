class TreatmentDiseasesController < BaseController
  before_action :set_treatment
  before_action :set_diseases, only: %i[new create]
  before_action :set_treatment_disease, only: %i[destroy]
  before_action :set_breadcrumbs

  def new
    @treatment_disease = TreatmentDisease.new
  end

  def create
    @treatment_disease = @treatment.treatment_diseases.build(treatment_disease_params)

    respond_to do |format|
      if @treatment_disease.save
        format.html { redirect_to treatment_url(@treatment), notice: t(".success") }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @treatment_disease.destroy

    respond_to do |format|
      format.html { redirect_to treatment_url(@treatment), notice: t(".success") }
    end
  end

  private

  def set_treatment
    @treatment = current_account.treatments.find(params[:treatment_id])
  end

  def set_treatment_disease
    @treatment_disease = @treatment.treatment_diseases.find(params[:id])
  end

  def set_diseases
    @diseases = current_account.diseases.all.map { |d| [d.predefined_disease.name, d.id] }
  end

  def treatment_disease_params
    params.require(:treatment_disease).permit(:disease_id)
  end

  def set_breadcrumbs
    add_breadcrumb t("breadcrumbs.home"), authenticated_root_path
    add_breadcrumb t(".breadcrumbs.index"), treatments_path
    add_breadcrumb @treatment.title, treatment_path(@treatment)

    case action_name.to_sym
    when :new, :create
      add_breadcrumb t(".breadcrumbs.new"), new_treatment_treatment_disease_path(@treatment)
    end
  end
end
