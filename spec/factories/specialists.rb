# == Schema Information
#
# Table name: specialists
#
#  id                         :uuid             not null, primary key
#  field_of_expertise         :string           default(""), not null
#  specialization             :string           default(""), not null
#  specialization_description :string           default(""), not null
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#  user_id                    :uuid             not null
#
# Indexes
#
#  index_specialists_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :specialist do
    specialization { Faker::Job.field }
    specialization_description { Faker::Job.key_skill }
    field_of_expertise { Faker::Job.field }
    user
  end
end
