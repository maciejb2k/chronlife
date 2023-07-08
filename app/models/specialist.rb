# == Schema Information
#
# Table name: accounts
#
#  id                         :uuid             not null, primary key
#  bio                        :text             default(""), not null
#  birthday                   :date             default(Thu, 01 Jan 1970), not null
#  city                       :string           default(""), not null
#  country                    :string           default(""), not null
#  education                  :string           default(""), not null
#  field_of_expertise         :string           default(""), not null
#  first_name                 :string           default(""), not null
#  is_completed               :boolean          default(FALSE), not null
#  is_verified                :boolean          default(FALSE), not null
#  last_name                  :string           default(""), not null
#  phone_number               :string           default(""), not null
#  sex                        :string           default(""), not null
#  specialization             :string           default(""), not null
#  specialization_description :string           default(""), not null
#  username                   :string
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#  user_id                    :uuid             not null
#
# Indexes
#
#  index_accounts_on_user_id   (user_id)
#  index_accounts_on_username  (username) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Specialist < Account
  validates :specialization, length: { maximum: 50 }, allow_blank: true
  validates :specialization_description, length: { maximum: 100 }, allow_blank: true
  validates :field_of_expertise, length: { maximum: 50 }, allow_blank: true
end
