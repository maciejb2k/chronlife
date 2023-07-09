# == Schema Information
#
# Table name: users
#
#  id                     :uuid             not null, primary key
#  confirmation_sent_at   :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  consumed_timestep      :integer
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  failed_attempts        :integer          default(0), not null
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :string
#  locked_at              :datetime
#  otp_backup_codes       :string           is an Array
#  otp_required_for_login :boolean
#  otp_secret             :string
#  provider               :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  sign_in_count          :integer          default(0), not null
#  uid                    :string
#  unconfirmed_email      :string
#  unlock_token           :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_unlock_token          (unlock_token) UNIQUE
#
class User < ApplicationRecord
  devise :two_factor_authenticatable
  devise :two_factor_authenticatable, :registerable, :recoverable, :rememberable,
         :validatable, :confirmable, :trackable, :lockable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  devise :two_factor_backupable,
         otp_backup_code_length: 32,
         otp_number_of_backup_codes: 10,
         otp_secret_encryption_key: ENV.fetch("OTP_SECRET_KEY", nil)

  serialize :otp_backup_codes, JSON

  has_one :account, dependent: :destroy
  has_many :user_roles, dependent: :destroy
  has_many :roles, through: :user_roles

  accepts_nested_attributes_for :account

  before_create :set_patient_role!

  def patient?
    roles.exists?(name: "patient")
  end

  def specialist?
    roles.exists?(name: "specialist")
  end

  def enable_two_factor!
    update!(otp_required_for_login: true)
  end

  def disable_two_factor!
    update!(
      otp_required_for_login: false,
      otp_secret: nil,
      otp_backup_codes: nil
    )
  end

  def two_factor_qr_code_uri
    issuer = ENV.fetch("OTP_2FA_ISSUER_NAME", nil)
    label = [issuer, email].join(":")

    otp_provisioning_uri(label, issuer:)
  end

  def generate_two_factor_secret_if_missing!
    return unless otp_secret.nil?

    update!(otp_secret: User.generate_otp_secret)
  end

  def two_factor_backup_codes_generated?
    otp_backup_codes.present?
  end

  def set_specialist_role!
    add_role("specialist")
  end

  def set_patient_role!
    add_role("patient")
  end

  def add_role(role_name)
    role = Role.find_by(name: role_name)
    return unless role

    roles << role unless roles.include?(role)
  end

  def self.from_omniauth!(auth)
    find_or_create_by!(provider: auth.provider, uid: auth.uid) do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.skip_confirmation!
    end
  end
end
