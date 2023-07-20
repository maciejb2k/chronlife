# == Schema Information
#
# Table name: treatments
#
#  id            :uuid             not null, primary key
#  description   :text             default(""), not null
#  effectiveness :integer          default(0), not null
#  end_date      :date
#  is_finished   :boolean          default(FALSE), not null
#  start_date    :date
#  title         :string           default(""), not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  account_id    :uuid             not null
#
# Indexes
#
#  index_treatments_on_account_id  (account_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#
FactoryBot.define do
  factory :treatment do
    title { "MyString" }
    description { "MyText" }
    start_date { "2023-07-20" }
    end_date { "2023-07-20" }
    effectiveness { 1 }
  end
end
