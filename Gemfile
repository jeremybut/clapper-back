# frozen_string_literal: true

source 'https://rubygems.org'

# Core
gem 'pg', '~> 0.21.0'
gem 'puma', '~> 3.9', '>= 3.9.1'
gem 'rails', '~> 5.1', '>= 5.1.1'

# Auth
gem 'devise', '~> 4.3'
gem 'rolify', '~> 5.1'

# Api
gem 'active_model_serializers', '~> 0.10.6'
gem 'doorkeeper', '~> 4.2', '>= 4.2.6'
gem 'rack-cors', '~> 0.4.1'
gem 'storext', '~> 2.2', '>= 2.2.2'

# JSON RPC
gem 'addressable', '~> 2.5'

# Dev
group :development do
  gem 'annotate'
  gem 'better_errors'
  gem 'listen'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'rubocop'
  gem 'rubocop-rspec'
  gem 'spring'
  gem 'spring-watcher-listen'
end

# Test
group :test do
  gem 'database_rewinder'
  gem 'factory_girl_rails'
  gem 'json_spec'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
  gem 'timecop'
  gem 'vcr'
  gem 'webmock', require: 'webmock/rspec'
end
