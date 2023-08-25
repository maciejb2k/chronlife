# == Schema Information
#
# Table name: treatment_updates
#
#  id           :uuid             not null, primary key
#  description  :text             default(""), not null
#  name         :string           default(""), not null
#  status       :string           default(""), not null
#  update_date  :datetime         not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  treatment_id :uuid             not null
#
# Indexes
#
#  index_treatment_updates_on_treatment_id  (treatment_id)
#
# Foreign Keys
#
#  fk_rails_...  (treatment_id => treatments.id)
#
FactoryBot.define do
  factory :treatment_update do
    name { Faker::Lorem.word }
    status { TreatmentUpdate::STATUSES.sample }
    description { Faker::Lorem.paragraph }
    update_date { Faker::Date.between(from: 1.year.ago, to: Time.zone.today) }
    treatment
  end
end
