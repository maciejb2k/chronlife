class MeasurementTypeResource < Avo::BaseResource
  self.title = :id
  self.includes = []
  # self.search_query = -> do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  field :id, as: :id
  # Fields generated from the model
  field :name, as: :text
  field :unit_id, as: :text
  field :upper_limit, as: :number
  field :lower_limit, as: :number
  field :measurements, as: :has_many
  field :unit, as: :belongs_to
  # add fields here
end
