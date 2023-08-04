# == Schema Information
#
# Table name: accounts
#
#  id                         :uuid             not null, primary key
#  bio                        :text             default(""), not null
#  birthday                   :date             default(Thu, 01 Jan 1970), not null
#  city                       :string           default(""), not null
#  country                    :string           default(""), not null
#  education                  :string           default(""), not null
#  field_of_expertise         :string           default(""), not null
#  first_name                 :string           default(""), not null
#  image_data                 :text
#  is_verified                :boolean          default(FALSE), not null
#  last_name                  :string           default(""), not null
#  phone_number               :string           default(""), not null
#  settings                   :jsonb            not null
#  sex                        :string           default(""), not null
#  specialization             :string           default(""), not null
#  specialization_description :string           default(""), not null
#  username                   :string
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#  user_id                    :uuid             not null
#
# Indexes
#
#  index_accounts_on_settings  (settings) USING gin
#  index_accounts_on_user_id   (user_id)
#  index_accounts_on_username  (username) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Account < ApplicationRecord
  include ImageUploader::Attachment(:image)

  EDUCATION_OPTIONS = %w[none primary secondary bachelor master doctorate].freeze

  belongs_to :user, dependent: :destroy

  has_many :diseases, dependent: :destroy
  has_many :treatments, dependent: :destroy
  has_many :notes, dependent: :destroy
  has_many :note_groups, dependent: :destroy
  has_many :note_tags, dependent: :destroy
  has_many :measurements, dependent: :destroy

  validates :first_name, presence: true, length: { maximum: 32 }
  validates :last_name, presence: true, length: { maximum: 32 }
  validates :username, presence: true, uniqueness: true, format: { with: /\A[a-z0-9_]+\z/i },
                       length: { maximum: 50 }

  validates :bio, length: { maximum: 100 }, allow_blank: true
  validates :sex, inclusion: { in: %w[male female other] }, allow_blank: true
  validates :birthday, timeliness: {
                         on_or_after: -> { 100.years.ago },
                         on_or_before: -> { 3.years.ago.to_date },
                         type: :date
                       },
                       allow_blank: true
  validates :country, length: { maximum: 50 }, allow_blank: true
  validates :city, length: { maximum: 50 }, allow_blank: true
  validates :phone_number, phone: { allow_blank: true }
  validates :education, inclusion: {
                          in: EDUCATION_OPTIONS
                        },
                        allow_blank: true

  def account_incomplete?
    first_name.blank? || last_name.blank? || username.blank? || birthday.blank?
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
