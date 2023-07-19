class DiseasesController < BaseController
  before_action :set_disease, only: %i[show edit update destroy]
  before_action :load_predefined_diseases, only: %i[new edit create]

  before_action :set_breadcrumbs
  before_action :set_breadcrumbs_new, only: %i[new]
  before_action :set_breadcrumbs_show, only: %i[show]
  before_action :set_breadcrumbs_edit, only: %i[edit]

  def index
    @pagy, @diseases = pagy(
      current_user.account.diseases.includes(:predefined_disease).all.order(severity: :desc)
    )
  end

  def show
    @disease_name = disease_name
  end

  def new
    @disease = Disease.new
  end

  def edit
    @selected_disease_id = @disease.predefined_disease.id
  end

  def create
    @disease = current_user.account.diseases.new(disease_params)

    respond_to do |format|
      if @disease.save
        format.html { redirect_to diseases_path, notice: "Choroba została poprawnie dodana." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @disease.update(disease_params)
        format.html do
          redirect_to disease_url(@disease),
                      notice: "Dane choroby zostały poprawnie zaktualizowane."
        end
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @disease.destroy

    respond_to do |format|
      format.html { redirect_to diseases_url, notice: "Choroba została poprawnie usunięta." }
      format.json { head :no_content }
    end
  end

  private

  def set_disease
    @disease = current_user.account.diseases.find(params[:id])
  end

  def disease_name
    @disease.predefined_disease.name.capitalize
  end

  def disease_params
    params.require(:disease).permit(:name, :diagnosed_at, :diagnosed_by_hp, :severity, :color,
                                    :predefined_disease_id)
  end

  def set_breadcrumbs
    add_breadcrumb("Home", authenticated_root_path)
    add_breadcrumb("Choroby", diseases_path)
  end

  def set_breadcrumbs_new
    add_breadcrumb("nowa choroba", new_disease_path)
  end

  def set_breadcrumbs_show
    add_breadcrumb(disease_name, @disease)
  end

  def set_breadcrumbs_edit
    add_breadcrumb("edytuj chorobę", edit_disease_path(@disease))
  end

  def load_predefined_diseases
    @predefined_diseases = PredefinedDisease.all.map { |d| [d.name.capitalize, d.id] }
  end
end
