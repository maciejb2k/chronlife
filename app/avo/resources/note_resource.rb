class NoteResource < Avo::BaseResource
  self.title = :id
  self.includes = []
  # self.search_query = -> do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  field :id, as: :id
  # Fields generated from the model
  field :title, as: :text
  field :content, as: :textarea
  field :background_color, as: :text
  field :is_pinned, as: :boolean
  field :account_id, as: :text
  field :account, as: :belongs_to
  field :note_group_associations, as: :has_many
  field :groups, as: :has_many, through: :note_group_associations
  field :note_tag_associations, as: :has_many
  # add fields here
end
