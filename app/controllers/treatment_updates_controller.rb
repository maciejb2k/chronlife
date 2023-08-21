class TreatmentUpdatesController < BaseController
  before_action :set_treatment
  before_action :set_treatment_update, only: %i[edit update destroy]
  before_action :set_treatment_status_options, only: %i[new create edit update]

  before_action :set_breadcrumbs
  before_action :set_breadcrumbs_new, only: %i[new create]
  before_action :set_breadcrumbs_edit, only: %i[edit update]

  def new
    @treatment_update = TreatmentUpdate.new
  end

  def create
    @treatment_update = @treatment.updates.build(treatment_update_params)

    respond_to do |format|
      if @treatment_update.save
        format.html do
          redirect_to @treatment,
                      notice: "Aktualizacja terapii została pomyślnie dodana."
        end
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @treatment_update.update(treatment_update_params)
        format.html do
          redirect_to edit_treatment_treatment_update_path(@treatment, @treatment_update),
                      notice: "Aktualizacja terapii została pomyślnie zapisana."
        end
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @treatment_update.destroy

    respond_to do |format|
      format.html do
        redirect_to @treatment, notice: "Aktualizacja terapii została pomyślnie usunięta."
      end
    end
  end

  private

  def set_treatment
    @treatment = current_account.treatments.find(params[:treatment_id])
  end

  def set_treatment_update
    @treatment_update = @treatment.updates.find(params[:id])
  end

  def set_treatment_status_options
    @treatment_status_options = TreatmentUpdate::STATUSES.map do |key|
      [I18n.t("activerecord.attributes.treatment_update.statuses.#{key}"), key]
    end
  end

  def treatment_update_params
    params.require(:treatment_update).permit(:name, :status, :description, :update_date,
                                             :treatment_id)
  end

  def set_breadcrumbs
    add_breadcrumb("home", authenticated_root_path)
    add_breadcrumb("terapie", treatments_path)
    add_breadcrumb(@treatment.title, treatment_path(@treatment))
  end

  def set_breadcrumbs_new
    add_breadcrumb("dodaj aktualizację", new_treatment_path)
  end

  def set_breadcrumbs_edit
    add_breadcrumb("edytuj aktualizację", edit_treatment_path(@treatment))
  end
end
