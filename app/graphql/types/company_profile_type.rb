module Types
  class CompanyProfileType < Types::BaseObject
    field :id, ID, null: false
    field :company, Types::CompanyType, null: false
    field :name, String, null: false
    field :subdomain, String, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
