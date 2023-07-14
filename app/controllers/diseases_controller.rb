class DiseasesController < BaseController
  before_action :set_breadcrumbs
  before_action :set_disease, only: %i[show edit update destroy]

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
    @predefined_diseases = PredefinedDisease.all.map { |d| [d.name.capitalize, d.id] }

    add_breadcrumb("Nowa choroba", new_disease_path)
  end

  def edit
    @predefined_diseases = PredefinedDisease.all.map { |d| [d.name.capitalize, d.id] }
    @selected_disease_id = @disease.predefined_disease.id

    add_breadcrumb("Edytuj chorobę", new_disease_path)
  end

  def create
    @predefined_diseases = PredefinedDisease.all.map { |d| [d.name.capitalize, d.id] }
    @disease = current_user.account.diseases.new(disease_params)

    respond_to do |format|
      if @disease.save
        format.html { redirect_to diseases_path, notice: "Choroba została dodana." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @disease.update(disease_params)
        format.html { redirect_to disease_url(@disease), notice: "Dane choroby zostały zaktualizowane." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @disease.destroy

    respond_to do |format|
      format.html { redirect_to diseases_url, notice: "Choroba została usunięta." }
      format.json { head :no_content }
    end
  end

  private

  def set_disease
    @disease = current_user.account.diseases.find(params[:id])
    add_breadcrumb(disease_name, @disease)
  end

  def disease_name
    @disease.predefined_disease.name.capitalize
  end

  def disease_params
    params.require(:disease).permit(:diagnosed_at, :diagnosed_by_hp, :severity, :color,
                                    :predefined_disease_id)
  end

  def set_breadcrumbs
    add_breadcrumb("Home", authenticated_root_path)
    add_breadcrumb("Choroby", diseases_path)
  end
end
