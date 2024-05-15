# frozen_string_literal: true

require "dotenv"
Dotenv.load(".env.local", ".env")

require_relative "../lib/example_app/config"
config = ExampleApp.config.web_server

# This configuration file will be evaluated by Puma. The top-level methods that
# are invoked here are part of Puma's configuration DSL. For more information
# about methods provided by the DSL, see https://puma.io/puma/Puma/DSL.html.

# Puma can serve each request in a thread from an internal thread pool.
# The `threads` method setting takes two numbers: a minimum and maximum.
# Any libraries that use thread pools should be configured to match
# the maximum value specified for Puma. Default is set to 5 threads for minimum
# and maximum; this matches the default thread size of Active Record.
threads config.max_threads, config.max_threads

# Specifies that the worker count should equal the number of processors in production.
if config.concurrency?
  require "concurrent-ruby"
  worker_count = Integer(ENV.fetch("WEB_CONCURRENCY") { Concurrent.physical_processor_count })
  workers worker_count if worker_count > 1
end

bind_address  = ENV.fetch("BIND_ADDRESS", config.default_bind_address)
bind_port     = ENV.fetch("PORT", config.default_port)
bind            "tcp://#{bind_address}:#{bind_port}"

# Specifies the `environment` that Puma will run in.
environment ExampleApp.config.rails.env

# Specifies the `pidfile` that Puma will use.
pidfile ENV.fetch("PIDFILE", "tmp/pids/server.pid")

# Allow puma to be restarted by `bin/rails restart` command.
plugin :tmp_restart
