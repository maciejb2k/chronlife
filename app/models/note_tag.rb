# == Schema Information
#
# Table name: note_tags
#
#  id         :uuid             not null, primary key
#  name       :string           default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  account_id :uuid             not null
#
# Indexes
#
#  index_note_tags_on_account_id           (account_id)
#  index_note_tags_on_name_and_account_id  (name,account_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#
class NoteTag < ApplicationRecord
  belongs_to :account

  has_many :note_tag_associations, dependent: :destroy
  has_many :notes, through: :note_tag_associations, inverse_of: :tags

  validates :name, uniqueness: true, presence: true, length: { maximum: 50 }
end
