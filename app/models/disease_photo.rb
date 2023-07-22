# == Schema Information
#
# Table name: disease_photos
#
#  id         :uuid             not null, primary key
#  caption    :string           default(""), not null
#  image_data :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  disease_id :uuid             not null
#
# Indexes
#
#  index_disease_photos_on_disease_id  (disease_id)
#
# Foreign Keys
#
#  fk_rails_...  (disease_id => diseases.id)
#
class DiseasePhoto < ApplicationRecord
  include ImageUploader::Attachment(:image)

  belongs_to :disease, inverse_of: :photos

  validates :caption, length: { maximum: 50 }, allow_blank: true
end
