# == Schema Information
#
# Table name: accounts
#
#  id           :uuid             not null, primary key
#  bio          :text             default(""), not null
#  birthday     :date
#  city         :string           default(""), not null
#  country      :string           default(""), not null
#  education    :string           default(""), not null
#  first_name   :string           default(""), not null
#  image_data   :text
#  is_verified  :boolean          default(FALSE), not null
#  last_name    :string           default(""), not null
#  phone_number :string           default(""), not null
#  settings     :jsonb            not null
#  sex          :string           default(""), not null
#  username     :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :uuid             not null
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

  belongs_to :user

  has_many :friend_requests, dependent: :destroy
  has_many :sent_friend_requests, class_name: "FriendRequest",
                                  dependent: :destroy
  has_many :received_friend_requests, class_name: "FriendRequest", foreign_key: :friend_id,
                                      dependent: :destroy, inverse_of: :friend

  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships

  has_many :group_members, dependent: :destroy
  has_many :groups, through: :group_members
  has_many :group_posts, dependent: :destroy

  has_many :diseases, dependent: :destroy
  has_many :treatments, dependent: :destroy
  has_many :notes, dependent: :destroy
  has_many :note_groups, dependent: :destroy
  has_many :note_tags, dependent: :destroy
  has_many :measurements, dependent: :destroy

  has_many :specialist_requests, dependent: :destroy
  has_many :articles, dependent: :destroy

  EDUCATION_OPTIONS = %w[none primary secondary bachelor master doctorate].freeze
  SEX_OPTIONS = %w[male female other].freeze

  validates :first_name, presence: true, length: { maximum: 32 }
  validates :last_name, presence: true, length: { maximum: 32 }
  validates :username, presence: true, uniqueness: true, length: { maximum: 50 }

  validates :bio, length: { maximum: 100 }, allow_blank: true
  validates :sex, inclusion: { in: SEX_OPTIONS }, allow_blank: true
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

  def full_name
    "#{first_name} #{last_name}"
  end

  def account_incomplete?
    first_name.blank? || last_name.blank? || username.blank?
  end

  # Friendship methods

  def all_friend_requests
    FriendRequest.where(
      "account_id = :account_id OR friend_id = :account_id", account_id: id
    )
  end

  def friend?(account)
    friends.exists?(account.id)
  end

  def friend_request_sent?(account)
    sent_friend_requests.exists?(friend_id: account.id)
  end

  def friend_request_received?(account)
    received_friend_requests.exists?(account_id: account.id)
  end
end
