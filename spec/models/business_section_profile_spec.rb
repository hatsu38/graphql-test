# == Schema Information
#
# Table name: business_section_profiles
#
#  id                    :bigint           not null, primary key
#  business_section_id   :bigint           not null
#  name(名前)            :string           default(""), not null
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#
# Indexes
#
#  index_business_section_profiles_on_business_section_id  (business_section_id)
#
# Foreign Keys
#
#  fk_rails_...  (business_section_id => business_sections.id)
#
require "rails_helper"

RSpec.describe BusinessSectionProfile, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
