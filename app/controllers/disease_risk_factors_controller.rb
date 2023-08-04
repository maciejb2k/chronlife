class DiseaseRiskFactorsController < ApplicationController
  layout "dashboard"

  before_action :set_disease
  before_action :set_disease_risk_factor, only: %i[show edit update destroy]

  before_action :set_breadcrumbs
  before_action :set_breadcrumbs_new, only: %i[new create]
  before_action :set_breadcrumbs_show, only: %i[show]
  before_action :set_breadcrumbs_edit, only: %i[edit update]

  def index
    @pagy, @disease_risk_factors = pagy(@disease.risk_factors.order(severity: :desc))
  end

  def show; end

  def new
    @disease_risk_factor = DiseaseRiskFactor.new
  end

  def edit; end

  def create
    @disease_risk_factor = @disease.risk_factors.build(disease_risk_factor_params)

    respond_to do |format|
      if @disease_risk_factor.save
        format.html do
          redirect_to disease_disease_risk_factors_path,
                      notice: "Nowy czynnik ryzyka został poprawnie dodany."
        end
        format.json { render :show, status: :created, location: @disease_risk_factor }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @disease_risk_factor.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @disease_risk_factor.update(disease_risk_factor_params)
        format.html do
          redirect_to disease_disease_risk_factor_url(@disease_risk_factor),
                      notice: "Czynnik ryzyka został poprawnie zaktualizowany."
        end
        format.json { render :show, status: :ok, location: @disease_risk_factor }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @disease_risk_factor.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @disease_risk_factor.destroy

    respond_to do |format|
      format.html do
        redirect_to disease_disease_risk_factors_url,
                    notice: "Czynnik ryzyka został poprawnie usunięty."
      end
      format.json { head :no_content }
    end
  end

  private

  def set_disease
    @disease = current_account.diseases.find(params[:disease_id])
  end

  def set_disease_risk_factor
    @disease_risk_factor = @disease.risk_factors.find(params[:id])
  end

  def disease_risk_factor_params
    params.require(:disease_risk_factor).permit(:name, :description, :severity)
  end

  def set_breadcrumbs
    add_breadcrumb("home", authenticated_root_path)
    add_breadcrumb("choroby", diseases_path)
    add_breadcrumb(@disease.predefined_disease.name, @disease)
    add_breadcrumb("czynniki ryzyka", disease_disease_risk_factors_path)
  end

  def set_breadcrumbs_new
    add_breadcrumb("dodaj czynnik ryzyka", new_disease_disease_risk_factor_path)
  end

  def set_breadcrumbs_show
    add_breadcrumb(@disease_risk_factor.name, [@disease, @disease_symptom])
  end

  def set_breadcrumbs_edit
    add_breadcrumb(@disease_risk_factor.name, [@disease, @disease_risk_factor])
    add_breadcrumb(
      "edytuj objaw",
      edit_disease_disease_risk_factor_path(@disease, @disease_risk_factor)
    )
  end
end
