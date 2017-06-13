# frozen_string_literal: true
source 'https://rubygems.org'

# Core
gem 'pg', '~> 0.19.0'
gem 'puma', '~> 3.6'
gem 'rails', '~> 5.0.0', '>= 5.0.0.1'

# Auth
gem 'devise', '~> 4.2'
gem 'rolify', '~> 5.1'

# Api
gem 'active_model_serializers', '~> 0.10.2'
gem 'doorkeeper', '~> 4.2'
gem 'rack-cors', require: 'rack/cors'
gem 'storext', '~> 2.2', '>= 2.2.1'

# JSON RPC
gem 'addressable', '~> 2.5'

# Abilities
gem 'cancancan', '~> 1.15'

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

ruby '2.3.1'
