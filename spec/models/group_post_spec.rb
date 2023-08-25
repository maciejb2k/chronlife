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
require "rails_helper"

RSpec.describe GroupPost, type: :model do
  describe "factory" do
    it { expect(create(:group_post)).to be_valid }
  end

  describe "associations" do
    it { is_expected.to belong_to(:group).inverse_of(:posts) }
    it { is_expected.to belong_to(:account) }
    it { is_expected.to have_many(:comments).dependent(:destroy) }
    it { is_expected.to have_many(:reactions).dependent(:destroy) }
  end

  describe "validations" do
    describe "body" do
      it { is_expected.to validate_presence_of(:body) }
      it { is_expected.to validate_length_of(:body).is_at_most(250) }
    end
  end
end
