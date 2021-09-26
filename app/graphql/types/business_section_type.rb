module Types
  class BusinessSectionType < Types::BaseObject
    field :id, ID, null: false
    field :business_division, Types::BusinessDivisionType, null: false
    field :business_section_profile, Types::BusinessSectionProfileType, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
