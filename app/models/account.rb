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
#  is_completed               :boolean          default(FALSE), not null
#  is_verified                :boolean          default(FALSE), not null
#  last_name                  :string           default(""), not null
#  phone_number               :string           default(""), not null
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
#  index_accounts_on_user_id   (user_id)
#  index_accounts_on_username  (username) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Account < ApplicationRecord
  belongs_to :user, dependent: :destroy

  has_one_attached :avatar
  has_one_attached :cover_photo

  validates :first_name, length: { maximum: 50 }, allow_blank: true
  validates :last_name, length: { maximum: 50 }, allow_blank: true
  validates :username, uniqueness: true, format: { with: /\A[a-z0-9_]+\z/i },
                       length: { maximum: 50 }, allow_blank: true
  validates :bio, length: { maximum: 100 }, allow_blank: true
  validates :sex, inclusion: { in: %w[male female other] }, allow_blank: true
  validates :birthday, timeliness: {
                         on_or_after: -> { 100.years.ago },
                         on_or_before: -> { Date.current },
                         type: :date
                       },
                       allow_blank: true
  validates :avatar, content_type: %i[png jpg jpeg],
                     size: { between: (1.kilobyte)..(2.megabytes) }
  validates :cover_photo, content_type: %i[png jpg jpeg],
                          size: { between: (1.kilobyte)..(2.megabytes) }
  validates :country, length: { maximum: 50 }, allow_blank: true
  validates :city, length: { maximum: 50 }, allow_blank: true
  validates :phone_number, phone: { allow_blank: true }
  validates :education, inclusion: {
                          in: %w[none primary secondary bachelor master doctorate]
                        },
                        allow_blank: true

  def account_incomplete?
    first_name.blank? || last_name.blank? || username.blank? || birthday.blank?
  end
end
