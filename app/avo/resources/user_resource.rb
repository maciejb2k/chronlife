class UserResource < Avo::BaseResource
  self.title = :id
  self.includes = []
  # self.search_query = -> do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  field :id, as: :id
  # Fields generated from the model
  field :email, as: :text
  field :sign_in_count, as: :number
  field :current_sign_in_at, as: :date_time
  field :last_sign_in_at, as: :date_time
  field :current_sign_in_ip, as: :text
  field :last_sign_in_ip, as: :text
  field :confirmation_token, as: :text
  field :confirmed_at, as: :date_time
  field :confirmation_sent_at, as: :date_time
  field :unconfirmed_email, as: :text
  field :failed_attempts, as: :number
  field :unlock_token, as: :text
  field :locked_at, as: :date_time
  field :otp_secret, as: :text
  field :consumed_timestep, as: :number
  field :otp_required_for_login, as: :boolean
  field :otp_backup_codes, as: :text
  field :provider, as: :text
  field :uid, as: :text
  field :account, as: :has_one
  field :user_roles, as: :has_many
  field :roles, as: :has_many, through: :user_roles
  # add fields here
end
