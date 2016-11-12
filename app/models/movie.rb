# == Schema Information
#
# Table name: movies
#
#  id                     :integer          not null, primary key
#  short_synopsis         :text
#  full_synopsis          :text
#  subtitle               :string
#  year                   :integer
#  genres_id              :integer
#  director               :string
#  title                  :string
#  studio                 :string
#  trailer_url            :string
#  origin                 :string
#  play_count             :integer
#  last_played            :string
#  date_added             :string
#  resume_time_in_seconds :float
#  total_time_in_seconds  :float
#

class Movie < ApplicationRecord
end
