# frozen_string_literal: true
module Api
  module V1
    class MoviesController < ApiController
      # authorize_resource class: false
      skip_authorization_check

      def index
        req = if %w(GetRecentlyAddedMovies).include?(permitted_params[:event])
                'VideoLibrary.' + permitted_params[:event]
              else
                'VideoLibrary.GetMovies'
              end

        movies = kodi_client.request(req, 'libMovies', movies_args)
        render json: movies, status: 200
      end

      def show
        movie = kodi_client.request(
          'VideoLibrary.GetMovieDetails', 'Video.Fields.Movie', movie_args
        )
        render json: movie, status: 200
      end

      private

      def movie_args
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

      def movies_args
        { properties: %w(title genre director thumbnail) }
      end

      def permitted_params
        params.permit(:event)
      end
    end
  end
end
