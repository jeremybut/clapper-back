# frozen_string_literal: true
module Api
  module V1
    class MoviesController < ApiController
      # load_and_authorize_resource
      skip_before_action :doorkeeper_authorize!
      skip_before_action :authenticate_user!
      skip_authorization_check
      before_action :set_movie, only: :show

      def index
        render json: Movie.all
      end

      def show
        render json: @movie
      end

      private

      def set_movie
        @movie = Movie.find(params[:id])
      end
    end
  end
end
