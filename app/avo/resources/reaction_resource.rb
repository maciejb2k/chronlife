class ReactionResource < Avo::BaseResource
  self.title = :id
  self.includes = []
  # self.search_query = -> do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  field :id, as: :id
  # Fields generated from the model
  field :reaction_type, as: :text
  field :account_id, as: :text
  field :reactable_type, as: :text
  field :reactable_id, as: :text
  field :reactable, as: :belongs_to, polymorphic_as: :reactable
  field :account, as: :belongs_to
  # add fields here
end
