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
class Admin < ApplicationRecord
  devise :database_authenticatable, :rememberable, :validatable
end
