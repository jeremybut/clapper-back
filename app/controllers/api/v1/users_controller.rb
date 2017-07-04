# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApiController
      load_and_authorize_resource only: :me
      load_and_authorize_resource param_method: :permitted_params, except: :me

      def update
        if current_user.update(permitted_params)
          render json: current_user, status: 200
        else
          errors_json(current_user.errors.full_messages, 422)
        end
      end

      def me
        render json: current_user, status: 200
      end

      private

      def permitted_params
        params.require(:user).permit(
          :email, :password, :kodi_username, :kodi_password, :kodi_host,
          :kodi_port
        )
      end
    end
  end
end
