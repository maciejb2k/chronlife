class DiseaseStatusResource < Avo::BaseResource
  self.title = :id
  self.includes = []
  # self.search_query = -> do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  field :id, as: :id
  # Fields generated from the model
  field :content, as: :textarea
  field :status, as: :text
  field :mood, as: :number
  field :disease_id, as: :text
  field :disease, as: :belongs_to
  field :comments, as: :has_many
  field :reactions, as: :has_many
  # add fields here
end
