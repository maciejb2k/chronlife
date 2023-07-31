# == Schema Information
#
# Table name: notes
#
#  id               :uuid             not null, primary key
#  background_color :string           default(""), not null
#  content          :text             default(""), not null
#  is_pinned        :boolean          default(FALSE), not null
#  title            :string           default(""), not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  account_id       :uuid             not null
#
# Indexes
#
#  index_notes_on_account_id  (account_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#
class Note < ApplicationRecord
  belongs_to :account

  has_many :note_group_associations, dependent: :destroy
  has_many :note_groups, through: :note_group_associations
  has_many :note_tag_associations, dependent: :destroy
  has_many :note_tags, through: :note_tag_associations

  validates :title, presence: true, length: { maximum: 50 }
  validates :content, presence: true, length: { maximum: 10_000 }
  validates :background_color, format: { with: /\A#?(?:[A-F0-9]{3}){1,2}\z/i }, allow_blank: true
end
