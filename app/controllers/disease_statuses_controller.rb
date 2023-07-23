class DiseaseStatusesController < ApplicationController
  layout "dashboard"

  before_action :set_disease
  before_action :set_disease_status, only: %i[show edit update destroy]
  before_action :set_disease_status_options, only: %i[new create edit update]

  before_action :set_breadcrumbs
  before_action :set_breadcrumbs_new, only: %i[new create]
  before_action :set_breadcrumbs_show, only: %i[show]
  before_action :set_breadcrumbs_edit, only: %i[edit update]

  def index
    @pagy, @disease_statuses = pagy(@disease.statuses.order(created_at: :desc), items: 8)
  end

  def show; end

  def new
    @disease_status = DiseaseStatus.new
  end

  def edit; end

  def create
    @disease_status = @disease.statuses.new(disease_status_params)

    respond_to do |format|
      if @disease_status.save
        format.html do
          redirect_to disease_disease_statuses_path,
                      notice: "Aktualizacja statusu choroby została poprawnie dodana."
        end
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @disease_status.update(disease_status_params)
        format.html do
          redirect_to disease_disease_status_path(@disease_status),
                      notice: "Poprawnie zaktualizowano status choroby."
        end
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @disease_status.destroy

    respond_to do |format|
      format.html do
        redirect_to disease_disease_statuses_path,
                    notice: "Status choroby został poprawnie usunięty."
      end
    end
  end

  private

  def set_disease
    @disease = current_user.account.diseases.find(params[:disease_id])
  end

  def set_disease_status
    @disease_status = @disease.statuses.find(params[:id])
  end

  def set_disease_status_options
    @disease_status_options = DiseaseStatus::STATUSES.map do |key|
      [I18n.t("activerecord.attributes.disease_status.statuses.#{key}"), key]
    end
  end

  def disease_status_params
    params.require(:disease_status).permit(:content, :mood, :status)
  end

  def set_breadcrumbs
    add_breadcrumb("home", authenticated_root_path)
    add_breadcrumb("choroby", diseases_path)
    add_breadcrumb(@disease.predefined_disease.name, @disease)
    add_breadcrumb("stan zdrowia", disease_disease_statuses_path)
  end

  def set_breadcrumbs_new
    add_breadcrumb("dodaj aktualizację", new_disease_disease_status_path)
  end

  def set_breadcrumbs_show
    add_breadcrumb("Stan z dnia #{@disease_status.created_at}", [@disease, @disease_status])
  end

  def set_breadcrumbs_edit
    add_breadcrumb(
      "edytuj status",
      edit_disease_disease_status_path(@disease, @disease_status)
    )
  end
end
