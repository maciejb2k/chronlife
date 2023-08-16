class DiseaseSymptomResource < Avo::BaseResource
  self.title = :id
  self.includes = []
  # self.search_query = -> do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  field :id, as: :id
  # Fields generated from the model
  field :name, as: :text
  field :description, as: :textarea
  field :first_noticed_at, as: :date
  field :disease_id, as: :text
  field :predefined_symptom_id, as: :text
  field :disease, as: :belongs_to
  field :predefined_symptom, as: :belongs_to
  field :updates, as: :has_many
  # add fields here
end
