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
#  otp_required_for_login :boolean
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
end
