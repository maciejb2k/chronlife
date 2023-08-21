class DiseasesController < BaseController
  before_action :set_disease, only: %i[show edit update destroy]
  before_action :load_predefined_diseases, only: %i[new edit create]
  before_action :set_breadcrumbs

  def index
    @pagy, @diseases = pagy(
      current_account.diseases.includes(:predefined_disease).all.order(severity: :desc)
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
    @disease = current_account.diseases.new(disease_params)

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
    @disease = current_account.diseases.find(params[:id])
  end

  def disease_name
    @disease.predefined_disease.name.capitalize
  end

  def disease_params
    params.require(:disease).permit(:name, :diagnosed_at, :diagnosed_by_hp, :severity, :color,
                                    :predefined_disease_id)
  end

  def set_breadcrumbs
    add_breadcrumb "home", authenticated_root_path
    add_breadcrumb "choroby", diseases_path

    case action_name.to_sym
    when :new, :create
      add_breadcrumb "nowa choroba", new_disease_path
    when :show
      add_breadcrumb disease_name, @disease
    when :edit, :update
      add_breadcrumb disease_name, @disease
      add_breadcrumb "edytuj chorobę", edit_disease_path(@disease)
    end
  end

  def load_predefined_diseases
    @predefined_diseases = PredefinedDisease.all.map { |d| [d.name.capitalize, d.id] }
  end
end
