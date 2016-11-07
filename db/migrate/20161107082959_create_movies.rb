# frozen_string_literal: true
class CreateMovies < ActiveRecord::Migration[5.0]
  def up
    create_table :movies do |t|
      t.text :short_synopsis
      t.text :full_synopsis
      t.string :subtitle
      t.integer :year
      t.references :genres
      t.string :director
      t.string :title
      t.string :studio
      t.string :trailer_url
      t.string :origin
      t.integer :play_count
      t.string :last_played
      t.string :date_added
      t.float :resume_time_in_seconds
      t.float :total_time_in_seconds
    end
  end

  def down
    remove_table :movies
  end
end
