class NoteGroupAssociationResource < Avo::BaseResource
  self.title = :id
  self.includes = []
  # self.search_query = -> do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  field :id, as: :id
  # Fields generated from the model
  field :note_id, as: :text
  field :note_group_id, as: :text
  field :note, as: :belongs_to
  field :note_group, as: :belongs_to
  # add fields here
end
