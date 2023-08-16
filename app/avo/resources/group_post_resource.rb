class GroupPostResource < Avo::BaseResource
  self.title = :id
  self.includes = []
  # self.search_query = -> do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  field :id, as: :id
  # Fields generated from the model
  field :body, as: :text
  field :group_id, as: :text
  field :account_id, as: :text
  field :group, as: :belongs_to
  field :account, as: :belongs_to
  field :comments, as: :has_many
  field :reactions, as: :has_many
  # add fields here
end
