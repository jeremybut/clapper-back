# frozen_string_literal: true

module Api
  module V1
    class SignupController < ApiController
      skip_before_action :doorkeeper_authorize!
      skip_before_action :authenticate_user!
      before_action :set_user

      def create
        return errors_json(I18n.t('.user.already_exists'), 409) if @user

        user = User.new(signup_params)
        if user.save
          access_token = Doorkeeper::AccessToken.create!(
            resource_owner_id: user.id
          ).token

          render json: {
            access_token: access_token,
            token_type: 'bearer',
            email: user.email,
            id: user.id
          }, status: 201
        else
          errors_json(user.errors, 422)
        end
      end

      private

      def set_user
        @user = User.find_by(email: signup_params[:email])
      end

      def signup_params
        params.require(:user).permit(
          :email, :password, :kodi_username, :kodi_password, :kodi_host,
          :kodi_port
        )
      end
    end
  end
end
