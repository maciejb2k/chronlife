class GroupMemberResource < Avo::BaseResource
  self.title = :id
  self.includes = []
  # self.search_query = -> do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  field :id, as: :id
  # Fields generated from the model
  field :group_id, as: :text
  field :account_id, as: :text
  field :group, as: :belongs_to
  field :account, as: :belongs_to
  # add fields here
end
