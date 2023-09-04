# == Schema Information
#
# Table name: measurement_raports
#
#  id              :uuid             not null, primary key
#  attachment_data :jsonb
#  name            :string           default(""), not null
#  raport_type     :string           default(""), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  account_id      :uuid             not null
#
# Indexes
#
#  index_measurement_raports_on_account_id       (account_id)
#  index_measurement_raports_on_attachment_data  (attachment_data) USING gin
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#
class MeasurementRaport < ApplicationRecord
  include FileUploader::Attachment(:attachment)

  belongs_to :account

  TYPES = %w[day].freeze

  validates :raport_type, presence: true, inclusion: { in: TYPES }
  validates :name, presence: true, length: { maximum: 100 }
end
