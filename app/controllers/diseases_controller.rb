class DiseasesController < BaseController
  before_action :set_disease, only: %i[show edit update destroy]
  before_action :set_predefined_diseases, only: %i[new create edit update]
  before_action :set_breadcrumbs

  with_options only: %i[index] do
    has_scope :by_severity
    has_scope :is_diagnosed_by_hp, type: :boolean
  end

  def index
    @pagy, @diseases = pagy(
      apply_scopes(
        current_account
        .diseases
        .includes(:predefined_disease)
        .order(severity: :desc)
      )
    )
  end

  def new
    @disease = Disease.new
  end

  def create
    @disease = current_account.diseases.build(disease_params)

    respond_to do |format|
      if @disease.save
        format.html { redirect_to diseases_path, notice: t(".success") }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @selected_disease_id = @disease.predefined_disease.id
  end

  def update
    respond_to do |format|
      if @disease.update(disease_params)
        format.html { redirect_to disease_url(@disease), notice: t(".success") }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @disease.destroy

    respond_to do |format|
      format.html { redirect_to diseases_url, notice: t(".success") }
    end
  end

  private

  def set_disease
    @disease = current_account.diseases.find(params[:id])
  end

  def disease_params
    params.require(:disease).permit(:name, :diagnosed_at, :diagnosed_by_hp, :severity, :color,
                                    :predefined_disease_id)
  end

  def set_predefined_diseases
    @predefined_diseases = PredefinedDisease.all.map { |d| [d.name, d.id] }
  end

  def set_breadcrumbs
    add_breadcrumb t(".breadcrumbs.home"), authenticated_root_path
    add_breadcrumb t(".breadcrumbs.index"), diseases_path

    case action_name.to_sym
    when :new, :create
      add_breadcrumb t(".breadcrumbs.new"), new_disease_path
    when :show
      add_breadcrumb @disease.predefined_disease.name, @disease
    when :edit, :update
      add_breadcrumb @disease.predefined_disease.name, @disease
      add_breadcrumb t(".breadcrumbs.edit"), edit_disease_path(@disease)
    end
  end
end
