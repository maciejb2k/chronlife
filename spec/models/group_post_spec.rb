# == Schema Information
#
# Table name: group_posts
#
#  id         :uuid             not null, primary key
#  body       :string           default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  account_id :uuid             not null
#  group_id   :uuid             not null
#
# Indexes
#
#  index_group_posts_on_account_id  (account_id)
#  index_group_posts_on_group_id    (group_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#  fk_rails_...  (group_id => groups.id)
#
require 'rails_helper'

RSpec.describe GroupPost, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
