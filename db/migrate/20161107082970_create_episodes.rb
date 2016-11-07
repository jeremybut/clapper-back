# frozen_string_literal: true
class CreateEpisodes < ActiveRecord::Migration[5.0]
  def up
    create_table :episodes do |t|
      t.integer :episode_number
      t.references :seasons
      t.string :title
      t.text :synopsis
      t.integer :play_count
      t.string :last_played
      t.string :date_added
      t.references :tv_shows
      t.string :studio
      t.float :resume_time_in_seconds
      t.float :total_time_in_seconds
    end
  end

  def down
    remove_table :episodes
  end
end
