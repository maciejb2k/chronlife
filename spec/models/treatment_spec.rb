# == Schema Information
#
# Table name: treatments
#
#  id            :uuid             not null, primary key
#  description   :text             default(""), not null
#  effectiveness :integer          default(0), not null
#  end_date      :date
#  is_finished   :boolean          default(FALSE), not null
#  start_date    :date
#  title         :string           default(""), not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  account_id    :uuid             not null
#
# Indexes
#
#  index_treatments_on_account_id  (account_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#
require 'rails_helper'

RSpec.describe Treatment, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
