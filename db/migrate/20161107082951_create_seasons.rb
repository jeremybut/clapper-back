# frozen_string_literal: true
class CreateSeasons < ActiveRecord::Migration[5.0]
  def up
    create_table :seasons do |t|
      t.integer :season_number
      t.references :tv_shows
      t.text :synopsis
      t.references :genres
      t.string :studio
      t.integer :number_of_episodes
      t.integer :play_count
    end
  end

  def down
    remove_table :seasons
  end
end
