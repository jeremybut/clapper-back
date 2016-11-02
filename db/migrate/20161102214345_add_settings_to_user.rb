# frozen_string_literal: true
class AddSettingsToUser < ActiveRecord::Migration[5.0]
  def up
    add_column :users, :settings, :jsonb, null: false, default: {}
  end

  def down
    remove_column :users, :settings
  end
end
