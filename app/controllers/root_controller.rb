# frozen_string_literal: true
class RootController < ApplicationController
  clear_respond_to

  def index
    render json: { errors: ['Please check API documentation'] }
  end
end
