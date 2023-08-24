# == Schema Information
#
# Table name: comments
#
#  id               :uuid             not null, primary key
#  body             :text             default(""), not null
#  commentable_type :string           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  account_id       :uuid             not null
#  commentable_id   :uuid             not null
#
# Indexes
#
#  index_comments_on_account_id   (account_id)
#  index_comments_on_commentable  (commentable_type,commentable_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#
require "rails_helper"

RSpec.describe Comment, type: :model do
  describe "factory" do
    it "has a valid factory" do
      expect(build(:comment)).to be_valid
    end
  end

  describe "associations" do
    it { is_expected.to belong_to(:commentable) }
    it { is_expected.to belong_to(:account) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:body) }
    it { is_expected.to validate_length_of(:body).is_at_most(500) }
  end
end
