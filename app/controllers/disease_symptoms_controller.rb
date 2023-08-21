class DiseaseSymptomsController < BaseController
  include DiseaseSettable
  include DashboardLayout

  before_action :set_disease_symptom, only: %i[show edit update destroy]
  before_action :set_symptom_name, only: %i[show edit update destroy]
  before_action :set_predefined_symptoms, only: %i[new edit update create]
  before_action :set_breadcrumbs

  def index
    @pagy_predefined, @predefined_symptoms = pagy(
      @disease
      .symptoms
      .includes(:predefined_symptom)
      .where.not(predefined_symptom_id: nil),
      page_param: :predefined_symptom_page
    )

    @pagy_custom, @custom_symptoms = pagy(
      @disease
      .symptoms
      .includes(:predefined_symptom)
      .where(predefined_symptom_id: nil),
      page_param: :custom_symptom_page
    )
  end

  def new
    @disease_symptom = DiseaseSymptom.new
  end

  def create
    @disease_symptom = @disease.symptoms.new(disease_symptom_params)

    respond_to do |format|
      if @disease_symptom.save
        format.html do
          redirect_to disease_symptom_path(@disease, @disease_symptom), notice: t(".success")
        end
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @disease_symptom.update(disease_symptom_params)
        format.html do
          redirect_to disease_symptom_path(@disease, @disease_symptom), notice: t(".success")
        end
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @disease_symptom.destroy

    respond_to do |format|
      format.html do
        redirect_to disease_symptoms_path, notice: t(".success")
      end
    end
  end

  private

  def set_disease_symptom
    @disease_symptom = @disease.symptoms.find(params[:id])
  end

  def set_symptom_name
    @symptom_name =
      if @disease_symptom.predefined_symptom_id.present?
        @disease_symptom.predefined_symptom.name
      else
        @disease_symptom.name
      end
  end

  def disease_symptom_params
    params.require(:disease_symptom).permit(:name, :description, :first_noticed_at, :disease_id,
                                            :predefined_symptom_id)
  end

  def set_predefined_symptoms
    @predefined_symptoms = @disease.predefined_disease.predefined_symptoms.map do |d|
      [d.name, d.id]
    end
  end

  def set_breadcrumbs
    add_breadcrumb t("diseases.breadcrumbs.home"), authenticated_root_path
    add_breadcrumb t("diseases.breadcrumbs.index"), diseases_path
    add_breadcrumb @disease.predefined_disease.name, @disease
    add_breadcrumb t(".breadcrumbs.index"), disease_symptoms_path

    case action_name.to_sym
    when :new, :create
      add_breadcrumb t(".breadcrumbs.new"), new_disease_symptom_path
    when :show
      add_breadcrumb @symptom_name, disease_symptom_path(@disease, @disease_symptom)
    when :edit, :update
      add_breadcrumb @symptom_name, disease_symptom_path(@disease, @disease_symptom)
      add_breadcrumb t(".breadcrumbs.edit"), edit_disease_symptom_path(@disease, @disease_symptom)
    end
  end
end
