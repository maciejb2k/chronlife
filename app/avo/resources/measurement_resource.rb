class MeasurementResource < Avo::BaseResource
  self.title = :id
  self.includes = []
  # self.search_query = -> do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  field :id, as: :id
  # Fields generated from the model
  field :value, as: :text
  field :measurement_date, as: :date_time
  field :measurement_type_id, as: :text
  field :account_id, as: :text
  field :account, as: :belongs_to
  field :measurement_type, as: :belongs_to
  # add fields here
end
