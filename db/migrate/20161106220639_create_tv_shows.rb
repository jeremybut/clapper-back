# frozen_string_literal: true
class CreateTvShows < ActiveRecord::Migration[5.0]
  def up
    create_table :tv_shows do |t|
      t.string :trailer_url
      t.string :title
      t.text :synopsis
      t.string :studio
      t.datetime :last_played
      t.datetime :date_added
      t.integer :total_count
      t.integer :watched_count
      t.integer :total_seasons
    end
  end

  def down
    remove_table :tv_shows
  end
end
