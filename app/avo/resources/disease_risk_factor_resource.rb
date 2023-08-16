class DiseaseRiskFactorResource < Avo::BaseResource
  self.title = :id
  self.includes = []
  # self.search_query = -> do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  field :id, as: :id
  # Fields generated from the model
  field :name, as: :text
  field :description, as: :textarea
  field :severity, as: :number
  field :disease_id, as: :text
  field :disease, as: :belongs_to
  # add fields here
end
