# frozen_string_literal: true
class CreateActors < ActiveRecord::Migration[5.0]
  def up
    create_table :actors do |t|
      t.string :fullname
    end
  end

  def down
    remove_table :actors
  end
end
