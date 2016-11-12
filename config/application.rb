# frozen_string_literal: true
require_relative 'boot'

require 'rails'
# Pick the frameworks you want:
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_view/railtie'
require 'action_cable/engine'
# require 'sprockets/railtie'
require 'rails/test_unit/railtie'

Bundler.require(*Rails.groups)

module Kovies
  class Application < Rails::Application
    ActiveModelSerializers.config.adapter = :json

    config.api_only = true
    Rails.application.routes.default_url_options[:host] = ENV['HOST']

    config.middleware.insert_before 'Rack::Runtime', 'Rack::Cors' do
      allow do
        origins '*'
        resource '*', headers: :any, methods: [
          :get, :put, :post, :patch, :delete, :options
        ]
      end
    end

    config.autoload_paths << "#{Rails.root}/lib"
  end
end
