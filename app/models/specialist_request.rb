# == Schema Information
#
# Table name: specialist_requests
#
#  id                         :uuid             not null, primary key
#  field_of_expertise         :string           default(""), not null
#  hash_code                  :string           default(""), not null
#  specialization             :string           default(""), not null
#  specialization_description :string           default(""), not null
#  status                     :string           default(""), not null
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#  account_id                 :uuid             not null
#
# Indexes
#
#  index_specialist_requests_on_account_id  (account_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#
class SpecialistRequest < ApplicationRecord
  belongs_to :account

  before_validation :set_status, on: :create
  before_create :set_hash_code

  STATES = %w[pending approved rejected].freeze

  validates :specialization, presence: true, length: { maximum: 50 }
  validates :specialization_description, presence: true, length: { maximum: 100 }
  validates :field_of_expertise, presence: true, length: { maximum: 50 }
  validates :status, inclusion: { in: STATES }

  def approve!
    ActiveRecord::Base.transaction do
      update!(status: "approved")
      account.user.set_specialist_role!
      account.user.specialist.update!(specialization:,
                                      specialization_description:,
                                      field_of_expertise:)
    end
  end

  def reject!
    ActiveRecord::Base.transaction do
      update!(status: "rejected")
      account.user.revoke_specialist_role!
    end
  end

  private

  def set_status
    self.status = "pending"
  end

  def set_hash_code
    self.hash_code = SecureRandom.hex(16)
  end
end
