# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.string :username,           null: false, default: ""
      t.string :prenom,             null: false, default: ""
      t.string :nom,                null: false, default: ""
      t.string :biographie,          null: false, default: "Aucune biographie."
      t.integer :id_clan,           null: false, default: 0
      t.integer :rang,              null: false, default: "membre"
      t.integer :xp,                null: false, default: 30
      t.string :lienAvatar,         null: false, default: "http://donatered-asset.s3.amazonaws.com/assets/default/default_user-884fcb1a70325256218e78500533affb.jpg"
      t.integer :tab_id_abonnement, null: false, default: 0

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at


      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :username,             unique: true
    add_index :users, :prenom,               unique: false
    add_index :users, :nom,                  unique: false
    add_index :users, :biographie,           unique: false
    add_index :users, :id_clan,              unique: false
    add_index :users, :rang,                 unique: false
    add_index :users, :xp,                   unique: false
    add_index :users, :lienAvatar,           unique: false
    add_index :users, :tab_id_abonnement,    unique: false
    add_index :users, :reset_password_token, unique: true
    # add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true
  end
end
