# == Schema Information
#
# Table name: note_groups
#
#  id         :uuid             not null, primary key
#  name       :string           default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  account_id :uuid             not null
#
# Indexes
#
#  index_note_groups_on_account_id           (account_id)
#  index_note_groups_on_name_and_account_id  (name,account_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#
class NoteGroup < ApplicationRecord
  belongs_to :account

  has_many :note_group_associations, dependent: :destroy
  has_many :notes, through: :note_group_associations

  validates :name, uniqueness: true, presence: true, length: { maximum: 50 }
  validates :color, format: { with: /\A#?(?:[A-F0-9]{3}){1,2}\z/i }, allow_blank: true
end
