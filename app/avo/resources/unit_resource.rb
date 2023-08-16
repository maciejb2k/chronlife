class UnitResource < Avo::BaseResource
  self.title = :id
  self.includes = []
  # self.search_query = -> do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  field :id, as: :id
  # Fields generated from the model
  field :name, as: :text
  field :symbol, as: :text
  field :description, as: :textarea
  field :measurement_types, as: :has_many
  # add fields here
end
