# frozen_string_literal: true
source 'https://rubygems.org'

# Core
gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
gem 'pg', '~> 0.19.0'
gem 'puma', '~> 3.6'

# Auth
gem 'devise', '~> 4.2'
gem 'rolify', '~> 5.1'

# Api
gem 'active_model_serializers', '~> 0.10.2'
gem 'doorkeeper', '~> 4.2'
gem 'storext', '~> 2.2', '>= 2.2.1'
gem 'rack-cors', require: 'rack/cors'

# JSON RPC
gem 'addressable', '~> 2.5'

# Abilities
gem 'cancancan', '~> 1.15'

# Dev
group :development do
  gem 'rubocop'
  gem 'rubocop-rspec'
  gem 'listen'
  gem 'spring'
  gem 'spring-watcher-listen'
  gem 'better_errors'
  gem 'annotate'
  gem 'pry-rails'
  gem 'pry-byebug'
end

# Test
group :test do
  gem 'database_rewinder'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'factory_girl_rails'
  gem 'json_spec'
  gem 'vcr'
  gem 'webmock', require: 'webmock/rspec'
  gem 'timecop'
  gem 'simplecov', require: false
end

gem 'bcrypt', '~> 3.1', '>= 3.1.11'
ruby '2.3.1'
