class Groups::DiseaseSymptomsController < Groups::BaseController
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
end
