# frozen_string_literal: true
module Api
  module V1
    class SignupController < ApiController
      skip_before_action :doorkeeper_authorize!
      skip_before_action :authenticate_user!
      skip_authorization_check

      def index
        user = User.new(signup_params)

        if user.save
          access_token = Doorkeeper::AccessToken.create!(
            resource_owner_id: user.id
          ).token

          render json: { token: access_token, user: user }, status: 201
        else
          render json: { errors: user.errors }, status: 422
        end
      end

      private

      def signup_params
        params.permit(
          :email, :password, :kodi_username, :kodi_password, :kodi_host,
          :kodi_port
        )
      end
    end
  end
end
