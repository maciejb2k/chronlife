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
require "rails_helper"

RSpec.describe Reaction, type: :model do
  describe "factory" do
    it { expect(build(:reaction)).to be_valid }
  end

  describe "associations" do
    it { is_expected.to belong_to(:reactable) }
    it { is_expected.to belong_to(:account) }
  end

  describe "validations" do
    describe "reaction_type" do
      it { is_expected.to validate_presence_of(:reaction_type) }

      it do
        is_expected.to(
          validate_inclusion_of(:reaction_type)
          .in_array(Reaction::TYPES)
        )
      end
    end

    describe "account_id" do
      let_it_be(:reaction) { create(:reaction) }

      it do
        is_expected.to(
          validate_uniqueness_of(:account_id)
          .scoped_to(:reactable_id, :reactable_type)
          .case_insensitive.with_message(:taken)
        )
      end
    end
  end

  describe "methods" do
    describe "#like?" do
      let_it_be(:reaction) { create(:reaction, reaction_type: "like") }
      it { expect(be_like).to be_truthy }
    end

    describe "#dislike?" do
      let_it_be(:reaction) { create(:reaction, reaction_type: "dislike") }
      it { expect(be_dislike).to be_truthy }
    end

    describe "#haha?" do
      let_it_be(:reaction) { create(:reaction, reaction_type: "haha") }
      it { expect(be_haha).to be_truthy }
    end

    describe "#love?" do
      let_it_be(:reaction) { create(:reaction, reaction_type: "love") }
      it { expect(be_love).to be_truthy }
    end

    describe "#sad?" do
      let_it_be(:reaction) { create(:reaction, reaction_type: "sad") }
      it { expect(be_sad).to be_truthy }
    end

    describe "#angry?" do
      let_it_be(:reaction) { create(:reaction, reaction_type: "angry") }
      it { expect(be_angry).to be_truthy }
    end
  end
end
