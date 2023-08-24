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
FactoryBot.define do
  factory :disease_photo do
    image do
      Rack::Test::UploadedFile.new(Rails.root.join("spec", "assets", "photo1.jpg"), "image/jpg")
    end

    caption { "MyString" }
    disease
  end
end
