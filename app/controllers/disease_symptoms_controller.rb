class DiseaseSymptomsController < BaseController
  layout "dashboard"

  before_action :set_disease
  before_action :set_disease_symptom,
                only: %i[show edit update destroy create_update destroy_update]
  before_action :set_symptom_name, only: %i[show edit update destroy]
  before_action :load_predefined_symptoms, only: %i[new edit update create]

  before_action :set_breadcrumbs
  before_action :set_breadcrumbs_new, only: %i[new create]
  before_action :set_breadcrumbs_show, only: %i[show]
  before_action :set_breadcrumbs_edit, only: %i[edit update]

  def index
    @disease_symptoms = @disease.symptoms.includes(:predefined_symptom)
    @predefined_symptoms = @disease_symptoms.to_a.select { |d| d.predefined_symptom_id.present? }
    @custom_symptoms = @disease_symptoms.to_a.select { |d| d.predefined_symptom_id.blank? }
  end

  def show
    @disease_symptom_update = DiseaseSymptomUpdate.new
    @pagy, @disease_symptom_updates = pagy(
      @disease_symptom.updates.order(update_date: :desc, intensity: :desc), items: 8
    )
  end

  def new
    @disease_symptom = DiseaseSymptom.new
  end

  def edit; end

  def create
    @disease_symptom = @disease.symptoms.new(disease_symptom_params)

    respond_to do |format|
      if @disease_symptom.save
        format.html do
          redirect_to disease_disease_symptoms_path,
                      notice: "Nowy objaw został poprawnie dodany."
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
          redirect_to [@disease, @disease_symptom],
                      notice: "Objaw został poprawnie zaktualizowany."
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
        redirect_to disease_disease_symptoms_path,
                    notice: "Objaw został poprawie usunięty."
      end
    end
  end

  private

  def set_disease
    @disease = current_user.account.diseases.find(params[:disease_id])
  end

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

  def disease_symptom_update_params
    params.require(:disease_symptom_update).permit(:intensity, :update_date)
  end

  def set_breadcrumbs
    add_breadcrumb("home", authenticated_root_path)
    add_breadcrumb("choroby", diseases_path)
    add_breadcrumb(@disease.predefined_disease.name, @disease)
    add_breadcrumb("objawy", disease_disease_symptoms_path)
  end

  def set_breadcrumbs_new
    add_breadcrumb("dodaj objaw", new_disease_disease_symptom_path)
  end

  def set_breadcrumbs_show
    add_breadcrumb(@symptom_name, [@disease, @disease_symptom])
  end

  def set_breadcrumbs_edit
    add_breadcrumb(@symptom_name, [@disease, @disease_symptom])
    add_breadcrumb("edytuj objaw", edit_disease_disease_symptom_path(@disease, @disease_symptom))
  end

  def load_predefined_symptoms
    @predefined_symptoms = @disease.predefined_disease.predefined_symptoms.map do |d|
      [d.name, d.id]
    end
  end
end
