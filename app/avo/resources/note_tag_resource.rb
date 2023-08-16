class NoteTagResource < Avo::BaseResource
  self.title = :id
  self.includes = []
  # self.search_query = -> do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  field :id, as: :id
  # Fields generated from the model
  field :name, as: :text
  field :account_id, as: :text
  field :account, as: :belongs_to
  field :note_tag_associations, as: :has_many
  field :notes, as: :has_many, through: :note_tag_associations
  # add fields here
end
