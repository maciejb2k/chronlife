# == Schema Information
#
# Table name: reactions
#
#  id             :uuid             not null, primary key
#  reactable_type :string           not null
#  reaction_type  :string           default(""), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  account_id     :uuid             not null
#  reactable_id   :uuid             not null
#
# Indexes
#
#  index_reactions_on_account_id  (account_id)
#  index_reactions_on_reactable   (reactable_type,reactable_id)
#  index_unique_user_reactable    (account_id,reactable_id,reactable_type) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#
FactoryBot.define do
  factory :reaction do
    reaction_type { "like" }
    account
    for_disease_status # default trait

    trait :for_disease_status do
      association :reactable, factory: :disease_status
    end

    trait :for_group_post do
      association :reactable, factory: :group_post
    end
  end
end
