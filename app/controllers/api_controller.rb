# frozen_string_literal: true

class ApiController < ActionController::API
  clear_respond_to
  respond_to :json

  before_action :doorkeeper_authorize!
  before_action :authenticate_user!

  private

  def authenticate_user!
    return if current_user

    errors_json('User is not authenticated!', 401)
  end

  def current_user
    User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
  end

  def errors_json(messages, code)
    render json: {
      "error": {
        "code": code,
        "message": [messages].flatten,
        "status": Rack::Utils::HTTP_STATUS_CODES[code].upcase
      }
    }, status: code
  end

  def kodi_client
    uri = "#{current_user.kodi_host}:#{current_user.kodi_port}/jsonrpc"
    KodiClient.new(uri)
  end
end
