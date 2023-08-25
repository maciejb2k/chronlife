# == Schema Information
#
# Table name: admins
#
#  id                  :uuid             not null, primary key
#  email               :string           default(""), not null
#  encrypted_password  :string           default(""), not null
#  remember_created_at :datetime
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
# Indexes
#
#  index_admins_on_email  (email) UNIQUE
#
FactoryBot.define do
  factory :admin do
    id { SecureRandom.uuid }
    email { Faker::Internet.email }
    password { "password" }
  end
end
