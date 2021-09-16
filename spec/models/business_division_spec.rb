# == Schema Information
#
# Table name: business_divisions
#
#  id           :bigint           not null, primary key
#  company_id   :bigint           not null
#  name(部署名) :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_business_divisions_on_company_id  (company_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#
require "rails_helper"

RSpec.describe BusinessDivision, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
