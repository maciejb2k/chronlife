# == Schema Information
#
# Table name: user_roles
#
#  id         :uuid             not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  role_id    :uuid             not null
#  user_id    :uuid             not null
#
# Indexes
#
#  index_user_roles_on_role_id              (role_id)
#  index_user_roles_on_user_id              (user_id)
#  index_user_roles_on_user_id_and_role_id  (user_id,role_id)
#
# Foreign Keys
#
#  fk_rails_...  (role_id => roles.id)
#  fk_rails_...  (user_id => users.id)
#
require "rails_helper"

RSpec.describe UserRole, type: :model do
  subject { build(:user_role, user: create(:user), role: create(:role)) }

  describe "factory" do
    it { is_expected.to be_valid }
  end

  describe "associations" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:role) }
  end

  describe "validations" do
    describe "user_id" do
      it do
        is_expected.to(
          validate_uniqueness_of(:user_id).scoped_to(:role_id)
          .case_insensitive.with_message(I18n.t("errors.messages.taken"))
        )
      end
    end
  end
end
