class DiseaseSymptomUpdateResource < Avo::BaseResource
  self.title = :id
  self.includes = []
  # self.search_query = -> do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  field :id, as: :id
  # Fields generated from the model
  field :intensity, as: :number
  field :update_date, as: :date
  field :disease_symptom_id, as: :text
  field :symptom, as: :belongs_to
  # add fields here
end
