class DiseaseResource < Avo::BaseResource
  self.title = :id
  self.includes = []
  # self.search_query = -> do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  field :id, as: :id
  # Fields generated from the model
  field :diagnosed_at, as: :date
  field :diagnosed_by_hp, as: :boolean
  field :severity, as: :number
  field :color, as: :text
  field :account_id, as: :text
  field :predefined_disease_id, as: :text
  field :disease_category_id, as: :text
  field :account, as: :belongs_to
  field :predefined_disease, as: :belongs_to
  field :disease_category, as: :belongs_to
  field :treatment_diseases, as: :has_many
  field :treatments, as: :has_many, through: :treatment_diseases
  field :symptoms, as: :has_many
  field :risk_factors, as: :has_many
  field :photos, as: :has_many
  field :statuses, as: :has_many
  # add fields here
end
