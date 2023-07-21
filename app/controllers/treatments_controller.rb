class TreatmentsController < BaseController
  layout "dashboard"

  before_action :set_treatment, only: %i[show edit update destroy]
  before_action :set_breadcrumbs
  before_action :set_breadcrumbs_new, only: %i[new create]
  before_action :set_breadcrumbs_show, only: %i[show]
  before_action :set_breadcrumbs_edit, only: %i[edit update]

  def index
    @pagy, @treatments = pagy(current_user.account.treatments.all)
  end

  def show
    @pagy_treatments, @treatment_updates = pagy(@treatment.updates.order(update_date: :desc))
    @pagy_treatment_diseases, @treatment_diseases = pagy(@treatment.treatment_diseases, items: 5)
  end

  def new
    @treatment = Treatment.new
  end

  def edit; end

  def create
    @treatment = current_user.account.treatments.build(treatment_params)

    respond_to do |format|
      if @treatment.save
        format.html do
          redirect_to treatments_path, notice: "Terapia została poprawnie dodana."
        end
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @treatment.update(treatment_params)
        format.html do
          redirect_to treatment_url(@treatment), notice: "Terapia została poprawnie zaktualizowana."
        end
        format.json { render :show, status: :ok, location: @treatment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @treatment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @treatment.destroy

    respond_to do |format|
      format.html { redirect_to treatments_path, notice: "Terapia została poprawnie usunięta." }
      format.json { head :no_content }
    end
  end

  def new_disease; end

  private

  def set_treatment
    @treatment = current_user.account.treatments.find(params[:id])
  end

  def treatment_params
    params.require(:treatment).permit(:title, :description, :start_date, :end_date,
                                      :effectiveness, :is_finished)
  end

  def set_breadcrumbs
    add_breadcrumb("home", authenticated_root_path)
    add_breadcrumb("terapie", treatments_path)
  end

  def set_breadcrumbs_new
    add_breadcrumb("dodaj terapię", new_treatment_path)
  end

  def set_breadcrumbs_show
    add_breadcrumb(@treatment.title, @treatment)
  end

  def set_breadcrumbs_edit
    add_breadcrumb("edytuj terapię", edit_treatment_path(@treatment))
  end
end
