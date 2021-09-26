module Types
  class CompanyType < Types::BaseObject
    field :id, ID, null: false
    field :company_profile, Types::CompanyProfileType, null: true
    field :business_divisions, [Types::BusinessDivisionType], null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
