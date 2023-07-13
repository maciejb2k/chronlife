# == Schema Information
#
# Table name: diseases
#
#  id                    :uuid             not null, primary key
#  color                 :string           default(""), not null
#  diagnosed_at          :date
#  diagnosed_by_hp       :boolean          default(FALSE), not null
#  severity              :integer          default(1), not null
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  account_id            :uuid             not null
#  disease_category_id   :uuid
#  predefined_disease_id :uuid             not null
#
# Indexes
#
#  index_diseases_on_account_id                            (account_id)
#  index_diseases_on_account_id_and_predefined_disease_id  (account_id,predefined_disease_id) UNIQUE
#  index_diseases_on_disease_category_id                   (disease_category_id)
#  index_diseases_on_predefined_disease_id                 (predefined_disease_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#  fk_rails_...  (disease_category_id => disease_categories.id)
#  fk_rails_...  (predefined_disease_id => predefined_diseases.id)
#
require 'rails_helper'

RSpec.describe Disease, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
