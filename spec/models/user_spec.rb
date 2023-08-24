# == Schema Information
#
# Table name: users
#
#  id                     :uuid             not null, primary key
#  confirmation_sent_at   :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  consumed_timestep      :integer
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  failed_attempts        :integer          default(0), not null
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :string
#  locked_at              :datetime
#  otp_backup_codes       :string           is an Array
#  otp_required_for_login :boolean          default(FALSE)
#  otp_secret             :string
#  provider               :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  sign_in_count          :integer          default(0), not null
#  uid                    :string
#  unconfirmed_email      :string
#  unlock_token           :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_unlock_token          (unlock_token) UNIQUE
#
require "rails_helper"

RSpec.describe User, type: :model do
  describe "associations" do
    it { is_expected.to have_one(:account).dependent(:destroy) }
    it { is_expected.to have_many(:user_roles).dependent(:destroy) }
    it { is_expected.to have_many(:roles).through(:user_roles) }
    it { is_expected.to have_one(:specialist).dependent(:destroy) }
  end

  describe "roles" do
    describe "#add_role" do
      let_it_be(:user) { create(:user) }

      it "adds a role to the user" do
        user.add_role "specialist"
        expect(user.roles.size).to eq(2)
      end

      it "adds only existing roles" do
        user.add_role "foo"
        expect(user.roles.size).to eq(1)
      end

      it "does not add the same role twice" do
        user.add_role "patient"
        expect(user.roles.size).to eq(1)
      end
    end

    describe "#remove_role" do
      let_it_be(:user) { create(:user, :specialist) }

      it "removes a role from the user" do
        user.remove_role "specialist"
        expect(user.roles.size).to eq(1)
      end

      it "removes only existing roles" do
        user.remove_role "foo"
        expect(user.roles.size).to eq(2)
      end

      it "does not remove the same role twice" do
        2.times { user.remove_role "specialist" }
        expect(user.roles.size).to eq(1)
      end
    end

    describe "#role?" do
      let_it_be(:user) { create(:user) }

      it "returns true if the user has the role" do
        expect(user.role?("patient")).to be true
      end

      it "returns false if the user does not have the role" do
        expect(user.role?("specialist")).to be false
      end
    end

    describe "#patient?" do
      let_it_be(:user) { create(:user) }

      it "returns true if the user has role patient" do
        expect(user.patient?).to be true
      end

      it "returns false if the user does not have role patient" do
        user.remove_role "patient"
        expect(user.patient?).to be false
      end
    end

    describe "#set_patient_role!" do
      let!(:user) { create(:user) }

      it "adds the patient role to the user" do
        expect(user.roles.size).to eq(1)
      end
    end

    describe "#set_specialist_role!" do
      let_it_be(:user) { create(:user) }

      before { user.set_specialist_role! }

      it "adds the specialist role to the user" do
        expect(user.roles.size).to eq(2)
      end

      it "creates a specialists record" do
        expect(user.specialist).to be_present
      end
    end

    describe "#revoke_specialist_role!" do
      let_it_be(:user) { create(:user, :specialist) }

      before { user.revoke_specialist_role! }

      it "removes the specialist role from the user" do
        expect(user.roles.size).to eq(1)
      end

      it "removes the specialists record" do
        expect(user.specialist).not_to be_present
      end
    end

    context "when the user is a new record" do
      let_it_be(:user) { create(:user) }

      it "has a patient role by default" do
        expect(user.patient?).to be true
      end

      it "has only one role" do
        expect(user.roles.size).to eq(1)
      end

      it "does not have a specialist role" do
        expect(user.specialist?).to be false
      end

      it "does not have an associated specialists record" do
        expect(user.specialist).not_to be_present
      end
    end

    context "when the user is a specialist" do
      let_it_be(:user) { create(:user, :specialist) }

      it "has a patient role" do
        expect(user.patient?).to be true
      end

      it "has a specialist role" do
        expect(user.specialist?).to be true
      end

      it "has two roles" do
        expect(user.roles.size).to eq(2)
      end

      it "has associated specialists record" do
        expect(user.specialist).to be_present
      end
    end

    context "when the specialist role is revoked" do
      let_it_be(:user) { create(:user, :specialist) }

      before do
        user.revoke_specialist_role!
      end

      it "has only a patient role" do
        expect(user.patient?).to be true
      end

      it "does not have a specialist role" do
        expect(user.specialist?).to be false
      end

      it "has one role" do
        expect(user.roles.size).to eq(1)
      end

      it "does not have an associated specialists record" do
        expect(user.specialist).not_to be_present
      end
    end
  end

  describe "2fa" do
    describe "#enable_two_factor!" do
      let_it_be(:user) { create(:user) }

      before { user.enable_two_factor! }

      it "enables 2fa for the user" do
        expect(user.otp_required_for_login).to be true
      end
    end

    describe "#disable_two_factor!" do
      let_it_be(:user) { create(:user, :two_factor_enabled) }

      before { user.disable_two_factor! }

      it "disables 2fa for the user" do
        expect(user.otp_required_for_login).to be false
        expect(user.otp_secret).to be_nil
        expect(user.otp_backup_codes).to be_nil
      end
    end

    describe "#two_factor_provisioning_uri" do
      let_it_be(:user) { create(:user, :two_factor_enabled) }

      it "returns a valid URI" do
        secret = described_class.generate_otp_secret
        expect(user.two_factor_provisioning_uri(secret)).to be_a String
      end
    end

    describe "#two_factor_otp_qrcode" do
      let_it_be(:user) { create(:user, :two_factor_enabled) }

      it "returns a valid QR code" do
        secret = described_class.generate_otp_secret
        uri = user.two_factor_provisioning_uri(secret)
        qrcode = user.two_factor_otp_qrcode(uri)
        expect(qrcode).to be_a RQRCode::QRCode
      end
    end

    describe "#generate_two_factor_secret_if_missing!" do
      let_it_be(:user) { create(:user) }

      context "when the user has no secret" do
        it "generates a secret" do
          expect(user.otp_secret).to be_nil
          user.generate_two_factor_secret_if_missing!
          expect(user.otp_secret).to be_present
        end
      end

      context "when the user has a secret" do
        let_it_be(:user) { create(:user, :two_factor_enabled) }

        it "does not generate a secret" do
          expect(user.otp_secret).to be_present
          user.generate_two_factor_secret_if_missing!
          expect(user.otp_secret).to be_present
        end
      end
    end

    describe "#two_factor_backup_codes_generated?" do
      context "when the user has no backup codes" do
        let_it_be(:user) { create(:user, :two_factor_enabled) }

        it "returns false" do
          expect(user.two_factor_backup_codes_generated?).to be false
        end
      end

      context "when the user has backup codes" do
        let_it_be(:user) { create(:user, :two_factor_enabled) }

        before { user.generate_otp_backup_codes! }

        it "returns true" do
          expect(user.two_factor_backup_codes_generated?).to be true
        end
      end
    end

    describe "#otp_enabled?" do
      context "when otp is not enabled" do
        let_it_be(:user) { create(:user) }

        it "returns false" do
          expect(user.otp_enabled?).to be false
        end
      end

      context "when otp is enabled" do
        let_it_be(:user) { create(:user, :two_factor_enabled) }

        it "returns true" do
          expect(user.otp_enabled?).to be true
        end
      end
    end
  end
end
