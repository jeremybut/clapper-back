# frozen_string_literal: true
class CreateGenres < ActiveRecord::Migration[5.0]
  def up
    create_table :genres do |t|
      t.string :name
    end
  end

  def down
    remove_table :genres
  end
end
