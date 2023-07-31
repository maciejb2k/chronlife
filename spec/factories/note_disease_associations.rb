# == Schema Information
#
# Table name: note_disease_associations
#
#  id         :uuid             not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  disease_id :uuid             not null
#  note_id    :uuid             not null
#
# Indexes
#
#  index_note_disease_associations_on_disease_id              (disease_id)
#  index_note_disease_associations_on_note_id                 (note_id)
#  index_note_disease_associations_on_note_id_and_disease_id  (note_id,disease_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (disease_id => diseases.id)
#  fk_rails_...  (note_id => notes.id)
#
FactoryBot.define do
  factory :note_disease_association do
    
  end
end
