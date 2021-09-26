module Types
  class EmployeeAuthenticationType < Types::BaseObject
    field :id, ID, null: false
    field :employee, Types::EmployeeType, null: false
    field :employee_invitation, Types::EmployeeInvitationType, null: false
    field :provider, String, null: false
    field :uid, String, null: false
    field :encrypted_password, String, null: false
    field :reset_password_token, String, null: true
    field :reset_password_sent_at, GraphQL::Types::ISO8601DateTime, null: true
    field :allow_password_change, Boolean, null: true
    field :remember_created_at, GraphQL::Types::ISO8601DateTime, null: true
    field :email, String, null: true
    field :tokens, Types::JsonType, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end