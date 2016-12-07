# frozen_string_literal: true
module Api
  module V1
    class MoviesController < ApiController
      authorize_resource class: false

      def index
        movies = kodi_client.request('VideoLibrary.GetMovies', 'libMovies')
        render json: movies, status: 200
      end

      def show
        movie = kodi_client.request(
          'VideoLibrary.GetMovieDetails', 'Video.Fields.Movie', args
        )
        render json: movie, status: 200
      end

      private

      def args
        {
          movieid: params[:id].to_i,
          properties: %w(
            title genre year rating director trailer mpaa top250 fanart votes
            sorttitle resume setid dateadded tag art tagline plot plotoutline
            originaltitle lastplayed playcount writer studio cast country
            imdbnumber runtime set showlink streamdetails thumbnail file
          )
        }
      end
    end
  end
end
