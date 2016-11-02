# frozen_string_literal: true
class CreateUsers < ActiveRecord::Migration[5.0]
  def up
    create_table :users do |t|
      t.timestamps
      t.string     :firstname
      t.string     :lastname
      t.string     :email
      t.string     :password_digest
      t.string     :token
    end
    add_index :users, :token, unique: true
  end

  def down
    drop_table :users
    remove_index(:users, name: 'token')
  end
end
