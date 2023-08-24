# == Schema Information
#
# Table name: disease_statuses
#
#  id         :uuid             not null, primary key
#  content    :text             default(""), not null
#  mood       :integer          default(3), not null
#  status     :string           default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  disease_id :uuid             not null
#
# Indexes
#
#  index_disease_statuses_on_disease_id  (disease_id)
#
# Foreign Keys
#
#  fk_rails_...  (disease_id => diseases.id)
#
FactoryBot.define do
  factory :disease_status do
    content { Faker::Lorem.paragraph }
    mood { rand(1..3) }
    status { DiseaseStatus::STATUSES.sample }
    disease
  end
end
