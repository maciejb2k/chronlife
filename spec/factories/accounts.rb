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
FactoryBot.define do
  factory :account do
    user
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    username { "#{first_name}#{last_name}" }

    trait :incomplete do
      first_name { nil }
      last_name { nil }
      username { nil }
    end
  end
end
