module Types
  class EmployeeInvitationType < Types::BaseObject
    field :id, ID, null: false
    field :employee_authentication, Types::EmployeeAuthenticationType, null: false
    field :invite_by_employee, Types::EmployeeType, null: false
    field :token, String, null: false
    field :token_expired_at, GraphQL::Types::ISO8601DateTime, null: true
    field :accepted_at, GraphQL::Types::ISO8601DateTime, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
