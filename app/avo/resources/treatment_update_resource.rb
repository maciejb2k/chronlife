class TreatmentUpdateResource < Avo::BaseResource
  self.title = :id
  self.includes = []
  # self.search_query = -> do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  field :id, as: :id
  # Fields generated from the model
  field :name, as: :text
  field :status, as: :text
  field :description, as: :textarea
  field :update_date, as: :date_time
  field :treatment_id, as: :text
  field :treatment, as: :belongs_to
  # add fields here
end
