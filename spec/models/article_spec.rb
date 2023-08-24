# == Schema Information
#
# Table name: articles
#
#  id          :uuid             not null, primary key
#  body        :text             default(""), not null
#  description :string           default(""), not null
#  title       :string           default(""), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  account_id  :uuid             not null
#
# Indexes
#
#  index_articles_on_account_id  (account_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#
require "rails_helper"

RSpec.describe Article, type: :model do
  describe "Factory" do
    it "has valid factory" do
      expect(create(:article)).to be_valid
    end
  end

  describe "associations" do
    it { is_expected.to belong_to(:account) }
  end

  describe "validations" do
    describe "title" do
      it { is_expected.to validate_presence_of(:title) }
      it { is_expected.to validate_length_of(:title).is_at_most(100) }
    end

    describe "description" do
      it { is_expected.to validate_length_of(:description).is_at_most(100) }
      it { is_expected.to allow_value("").for(:description) }
    end

    describe "body" do
      it { is_expected.to validate_presence_of(:body) }
      it { is_expected.to validate_length_of(:body).is_at_most(5000) }
    end
  end
end
