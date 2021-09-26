module Types
  class BusinessDivisionType < Types::BaseObject
    field :id, ID, null: false
    field :company, Types::CompanyType, null: false
    field :business_division_profile, [Types::BusinessDivisionProfileType], null: true
    field :business_sections, [Types::BusinessSection], null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
