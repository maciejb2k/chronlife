class TreatmentUpdatesController < BaseController
  before_action :set_treatment
  before_action :set_treatment_update, only: %i[edit update destroy]
  before_action :set_treatment_status_options, only: %i[new create edit update]
  before_action :set_breadcrumbs

  def new
    @treatment_update = TreatmentUpdate.new
  end

  def create
    @treatment_update = @treatment.updates.build(treatment_update_params)

    respond_to do |format|
      if @treatment_update.save
        format.html { redirect_to @treatment, notice: t(".success") }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @treatment_update.update(treatment_update_params)
        format.html { redirect_to treatment_path(@treatment), notice: t(".success") }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @treatment_update.destroy

    respond_to do |format|
      format.html { redirect_to @treatment, notice: t(".success") }
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
    add_breadcrumb t("breadcrumbs.home"), authenticated_root_path
    add_breadcrumb t(".breadcrumbs.index"), treatments_path
    add_breadcrumb @treatment.title, treatment_path(@treatment)

    case action_name.to_sym
    when :new, :create
      add_breadcrumb t(".breadcrumbs.new"), new_treatment_treatment_update_path(@treatment)
    when :edit, :update
      add_breadcrumb t(".breadcrumbs.edit"),
                     edit_treatment_treatment_update_path(@treatment, @treatment_update)
    end
  end
end
