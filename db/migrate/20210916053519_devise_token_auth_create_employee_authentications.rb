class DeviseTokenAuthCreateEmployeeAuthentications < ActiveRecord::Migration[6.1]
  def change
    create_table(:employee_authentications) do |t|
      t.references :employee, null: false, foreign_key: true
      ## Required
      t.string :provider, null: false, default: "email", comment: "認証方法"
      t.string :uid, null: false, default: ""

      ## Database authenticatable
      t.string :encrypted_password, null: false, default: "", comment: "暗号化されたパスワード"

      ## Recoverable
      t.string   :reset_password_token, comment: "パスワードリセットのためのToken"
      t.datetime :reset_password_sent_at, comment: "パスワードリセットをした時刻"
      t.boolean  :allow_password_change, null: false, default: false, comment: "パスワード変更が可能か"

      ## Rememberable
      t.datetime :remember_created_at, comment: "認証情報を保存した時刻"

      ## Confirmable
      t.string   :confirmation_token, comment: "SignUp時に確認する際のToken"
      t.datetime :confirmed_at, comment: "SignUp時に確認された時刻"
      t.datetime :confirmation_sent_at, comment: "SignUpに必要な確認メールが送られた時刻"
      t.string   :unconfirmed_email, comment: "まだ確認されていないEmail" # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, :default => 0, :null => false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at

      ## User Info
      # t.string :name
      # t.string :nickname
      # t.string :image
      t.string :email, null: false, default: "", comment: "Email"

      ## Tokens
      t.json :tokens, comment: "Token"

      t.timestamps
    end

    add_index :employee_authentications, :email,                unique: true
    add_index :employee_authentications, [:uid, :provider],     unique: true
    add_index :employee_authentications, :reset_password_token, unique: true
    add_index :employee_authentications, :confirmation_token,   unique: true
    # add_index :employee_authentications, :unlock_token,         unique: true
  end
end
