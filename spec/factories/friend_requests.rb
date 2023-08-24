# == Schema Information
#
# Table name: friend_requests
#
#  id         :uuid             not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  account_id :uuid             not null
#  friend_id  :uuid             not null
#
# Indexes
#
#  index_friend_requests_on_account_id  (account_id)
#  index_friend_requests_on_friend_id   (friend_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#  fk_rails_...  (friend_id => accounts.id)
#
FactoryBot.define do
  factory :friend_request do
    account { nil }
    friend { nil }
  end
end
