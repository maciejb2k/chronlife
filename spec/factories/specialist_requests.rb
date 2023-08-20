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
FactoryBot.define do
  factory :specialist_request do

  end
end
