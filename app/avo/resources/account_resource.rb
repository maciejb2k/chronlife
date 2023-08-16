class AccountResource < Avo::BaseResource
  self.title = :id
  self.includes = []
  # self.search_query = -> do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  field :id, as: :id
  # Fields generated from the model
  field :first_name, as: :text
  field :last_name, as: :text
  field :username, as: :text
  field :bio, as: :textarea
  field :sex, as: :text
  field :birthday, as: :date
  field :country, as: :country
  field :city, as: :text
  field :phone_number, as: :text
  field :education, as: :text
  field :is_verified, as: :boolean
  field :specialization, as: :text
  field :specialization_description, as: :text
  field :field_of_expertise, as: :text
  field :user_id, as: :text
  field :settings, as: :text
  field :image_data, as: :textarea
  field :user, as: :belongs_to
  field :friend_requests, as: :has_many
  field :sent_friend_requests, as: :has_many
  field :received_friend_requests, as: :has_many
  field :friendships, as: :has_many
  field :friends, as: :has_many, through: :friendships
  field :group_members, as: :has_many
  field :groups, as: :has_many, through: :group_members
  field :group_posts, as: :has_many
  field :diseases, as: :has_many
  field :treatments, as: :has_many
  field :notes, as: :has_many
  field :note_groups, as: :has_many
  field :measurements, as: :has_many
  # add fields here
end
