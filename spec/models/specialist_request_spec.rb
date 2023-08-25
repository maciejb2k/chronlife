# == Schema Information
#
# Table name: specialist_requests
#
#  id                         :uuid             not null, primary key
#  field_of_expertise         :string           default(""), not null
#  hash_code                  :string           default(""), not null
#  specialization             :string           default(""), not null
#  specialization_description :string           default(""), not null
#  status                     :string           default(""), not null
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#  account_id                 :uuid             not null
#
# Indexes
#
#  index_specialist_requests_on_account_id  (account_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#
require "rails_helper"

RSpec.describe SpecialistRequest, type: :model do
  describe "factory" do
    it { expect(build(:specialist_request)).to be_valid }
  end

  describe "associations" do
    it { is_expected.to belong_to(:account) }
  end

  describe "validations" do
    describe "specialization" do
      it { is_expected.to validate_presence_of(:specialization) }
      it { is_expected.to validate_length_of(:specialization).is_at_most(50) }
    end

    describe "specialization_description" do
      it { is_expected.to validate_presence_of(:specialization_description) }
      it { is_expected.to validate_length_of(:specialization_description).is_at_most(100) }
    end

    describe "field_of_expertise" do
      it { is_expected.to validate_presence_of(:field_of_expertise) }
      it { is_expected.to validate_length_of(:field_of_expertise).is_at_most(50) }
    end

    describe "status" do
      context "when creating a new specialist request" do
        let_it_be(:request) { build(:specialist_request) }

        it 'sets default status to "pending" on create' do
          expect(request.status).to be_blank
          request.valid?
          expect(request.status).to eq("pending")
        end

        it { expect(create(:specialist_request).status).to eq("pending") }
      end

      context "when updating a specialist request" do
        it do
          is_expected.to(
            validate_inclusion_of(:status).in_array(SpecialistRequest::STATES).on(:update)
          )
        end
      end
    end

    describe "hash_code" do
      context "when creating a new specialist request" do
        let_it_be(:request) { build(:specialist_request) }

        it "sets hash_code to a random 16 character string" do
          expect(request.hash_code).to be_blank
          request.save!
          expect(request.hash_code).to be_present
          expect(request.hash_code.length).to eq(32)
        end
      end
    end
  end

  describe "#approve!" do
    let_it_be(:request) { create(:specialist_request) }

    after do
      request.account.user.revoke_specialist_role!
    end

    it "updates the status to approved" do
      expect(request.status).to eq("pending")
      request.approve!
      expect(request.status).to eq("approved")
    end

    it "sets the specialist role" do
      expect(request.account.user).not_to be_specialist
      request.approve!
      expect(request.account.user).to be_specialist
    end

    it "updates the specialist's attributes" do
      current_user = request.account.user

      expect(current_user.specialist.nil?).to be true
      request.approve!
      expect(current_user.specialist.nil?).to be false
      expect(current_user.specialist.specialization).to eq(request.specialization)
      expect(current_user.specialist.specialization_description).to(
        eq(request.specialization_description)
      )
      expect(current_user.specialist.field_of_expertise).to eq(request.field_of_expertise)
    end
  end

  describe "#reject!" do
    let_it_be(:request) { create(:specialist_request) }

    after do
      request.account.user.revoke_specialist_role!
    end

    it "updates the status to rejected" do
      expect(request.status).to eq("pending")
      request.reject!
      expect(request.status).to eq("rejected")
    end

    it "revokes the specialist role" do
      request.account.user.set_specialist_role!
      expect(request.account.user).to be_specialist
      request.reject!
      expect(request.account.user).not_to be_specialist
    end
  end

  # TODO: Check transactional behavior of approve! and reject!
end
