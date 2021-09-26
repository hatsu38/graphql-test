module Types
  class EmployeeType < Types::BaseObject
    field :id, ID, null: false
    field :employee_profile, Types::EmployeeProfileType, null: false
    field :employee_authentication, Types::EmployeeAuthenticationType, null: false
    field :employee_invitations, [Types::EmployeeInvitationType], null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
