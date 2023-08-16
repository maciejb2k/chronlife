class TreatmentResource < Avo::BaseResource
  self.title = :id
  self.includes = []
  # self.search_query = -> do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  field :id, as: :id
  # Fields generated from the model
  field :title, as: :text
  field :description, as: :textarea
  field :start_date, as: :date
  field :end_date, as: :date
  field :is_finished, as: :boolean
  field :effectiveness, as: :number
  field :account_id, as: :text
  field :account, as: :belongs_to
  field :updates, as: :has_many
  field :treatment_diseases, as: :has_many
  field :diseases, as: :has_many, through: :treatment_diseases
  # add fields here
end
