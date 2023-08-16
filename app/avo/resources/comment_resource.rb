class CommentResource < Avo::BaseResource
  self.title = :id
  self.includes = []
  # self.search_query = -> do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  field :id, as: :id
  # Fields generated from the model
  field :body, as: :textarea
  field :account_id, as: :text
  field :commentable_type, as: :text
  field :commentable_id, as: :text
  field :commentable, as: :belongs_to, polymorphic_as: :commentable
  field :account, as: :belongs_to
  # add fields here
end
