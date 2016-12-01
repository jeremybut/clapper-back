# frozen_string_literal: true
module Api
  module V1
    class MoviesController < ApiController
      authorize_resource class: false

      def index
        movies = kodi_client.request('VideoLibrary.GetMovies', 'libMovies')
        render json: movies, status: 200
      end
    end
  end
end
