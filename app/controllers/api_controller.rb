# frozen_string_literal: true
class ApiController < ActionController::API
  include CanCan::ControllerAdditions

  clear_respond_to
  respond_to :json

  before_action :doorkeeper_authorize!
  before_action :authenticate_user!

  check_authorization unless: :devise_controller?

  rescue_from CanCan::AccessDenied do |e|
    render json: errors_json(e.message), status: :forbidden
  end

  rescue_from ActiveRecord::RecordNotFound do |e|
    render json: errors_json(e.message), status: :not_found
  end

  private

  def authenticate_user!
    return if current_user

    render json: {
      errors: ['User is not authenticated!']
    }, status: :unauthorized
  end

  def current_user
    User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
  end

  def pagination_dict(object)
    {
      current_page: object.current_page,
      next_page: object.next_page,
      prev_page: object.prev_page,
      total_pages: object.total_pages,
      total_count: object.total_count
    }
  end

  def errors_json(messages)
    { errors: [*messages] }
  end
end
