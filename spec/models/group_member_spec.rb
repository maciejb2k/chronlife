# == Schema Information
#
# Table name: group_members
#
#  id         :uuid             not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  account_id :uuid
#  group_id   :uuid
#
# Indexes
#
#  index_group_members_on_account_id               (account_id)
#  index_group_members_on_group_id                 (group_id)
#  index_group_members_on_group_id_and_account_id  (group_id,account_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#  fk_rails_...  (group_id => groups.id)
#
require 'rails_helper'

RSpec.describe GroupMember, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
