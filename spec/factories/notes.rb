# == Schema Information
#
# Table name: notes
#
#  id               :uuid             not null, primary key
#  background_color :string           default(""), not null
#  content          :text             default(""), not null
#  is_pinned        :boolean          default(FALSE), not null
#  title            :string           default(""), not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  account_id       :uuid             not null
#
# Indexes
#
#  index_notes_on_account_id  (account_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#
FactoryBot.define do
  factory :note do
    
  end
end
