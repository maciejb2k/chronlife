# == Schema Information
#
# Table name: friendships
#
#  id         :uuid             not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  account_id :uuid             not null
#  friend_id  :uuid             not null
#
# Indexes
#
#  index_friendships_on_account_id  (account_id)
#  index_friendships_on_friend_id   (friend_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#  fk_rails_...  (friend_id => accounts.id)
#
require 'rails_helper'

RSpec.describe Friendship, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
