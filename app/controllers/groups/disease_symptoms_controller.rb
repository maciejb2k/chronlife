class Groups::DiseaseSymptomsController < Groups::BaseController
  before_action :set_breadcrumbs

  def index
    @predefined_symptoms =
      DiseaseSymptom
      .joins(:predefined_symptom, disease: %i[account predefined_disease])
      .includes(:predefined_symptom, disease: %i[account predefined_disease])
      .where(disease: { account: @group.accounts, predefined_disease: @group.predefined_disease })
      .where.not(predefined_symptom_id: nil)
      .group("predefined_symptoms.name")
      .count
      .sort_by { |_, v| -v }

    @pagy_custom, @custom_symptoms = pagy(
      DiseaseSymptom
      .joins(disease: :account)
      .includes(disease: :account)
      .where(disease: { account: @group.accounts, predefined_disease: @group.predefined_disease },
             predefined_symptom_id: nil)
    )
  end

  private

  def set_breadcrumbs
    add_breadcrumb t("groups.disease_symptoms_controller.breadcrumbs.index"),
                   group_disease_symptoms_path(@group)
  end
end
