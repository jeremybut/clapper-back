# frozen_string_literal: true
class CreateActorsMovies < ActiveRecord::Migration[5.0]
  def up
    create_table :actors_movies do |t|
      t.references :actors
      t.string :media_type
      t.string :role
      t.integer :cast_order
    end
  end

  def down
    remove_table :actors_movies
  end
end
