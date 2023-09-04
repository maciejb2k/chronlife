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
FactoryBot.define do
  factory :measurement_raport do
    raport_type { MeasurementRaport::TYPES.sample }
    name { Faker::Lorem.sentence }
    attachment do
      Rack::Test::UploadedFile.new(Rails.root.join("spec", "assets", "raport1.pdf"),
                                   "application/pdf")
    end
    account
  end
end
