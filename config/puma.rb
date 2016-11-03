# frozen_string_literal: true
# Threads
threads_count = ENV.fetch('RAILS_MAX_THREADS') { 1 }.to_i
threads threads_count, threads_count

# Workers
workers ENV.fetch('WEB_CONCURRENCY') { 2 }

environment ENV.fetch('RAILS_ENV') { 'development' }

preload_app!
daemonize false
rackup DefaultRackup

bind 'unix:///tmp/web_server.sock'
state_path '/tmp/web_server.state'
pidfile '/tmp/web_server.pid'
