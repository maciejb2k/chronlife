# == Schema Information
#
# Table name: admins
#
#  id                  :uuid             not null, primary key
#  email               :string           default(""), not null
#  encrypted_password  :string           default(""), not null
#  remember_created_at :datetime
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
# Indexes
#
#  index_admins_on_email  (email) UNIQUE
#
require "rails_helper"

RSpec.describe Admin, type: :model do
  describe "factory" do
    it { expect(build(:admin)).to be_valid }
  end
end
