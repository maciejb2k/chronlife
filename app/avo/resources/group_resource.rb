class GroupResource < Avo::BaseResource
  self.title = :id
  self.includes = []
  # self.search_query = -> do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  field :id, as: :id
  # Fields generated from the model
  field :predefined_disease_id, as: :text
  field :name, as: :text
  field :description, as: :textarea
  field :predefined_disease, as: :belongs_to
  field :group_members, as: :has_many
  field :accounts, as: :has_many, through: :group_members
  field :posts, as: :has_many
  # add fields here
end
