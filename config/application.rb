require_relative 'boot'

require 'rails'
require 'active_model/railtie'
require 'active_record/railtie'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_view/railtie'

Bundler.require(*Rails.groups)

module Clapper
  class Application < Rails::Application
    config.load_defaults 5.1
    config.api_only = true
    config.autoload_paths << "#{Rails.root}/lib"

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*', headers: :any,
                      methods: %i[get post options put head delete]
      end
    end
  end
end
