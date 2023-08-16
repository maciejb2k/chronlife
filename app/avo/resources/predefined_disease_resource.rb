class PredefinedDiseaseResource < Avo::BaseResource
  self.title = :id
  self.includes = []
  # self.search_query = -> do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  field :id, as: :id
  # Fields generated from the model
  field :name, as: :text
  field :related_names, as: :text
  field :description, as: :textarea
  field :icd10_code, as: :text
  field :disease, as: :has_many
  field :predefined_symptoms, as: :has_many
  # add fields here
end
