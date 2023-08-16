class PredefinedSymptomResource < Avo::BaseResource
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
  field :predefined_disease_id, as: :text
  field :predefined_disease, as: :belongs_to
  # add fields here
end
