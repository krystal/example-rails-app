# frozen_string_literal: true

require_relative "boot"

require "rails"
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

require_relative "../lib/example_app"

module ExampleApp
  class Application < Rails::Application

    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.1

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    # config.autoload_lib(ignore: %w[assets tasks])

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # Add the web hostname to the list of allowed hosts
    config.hosts << ExampleApp.config.example_app.web_hostname
    config.host_authorization = { exclude: -> (request) { request.path == "/up" } }

    # Disable rails logging is it has been disabled
    unless ExampleApp.config.log.rails?
      config.logger = Logger.new("/dev/null")
    end

    # Disable most generators
    config.generators do |g|
      g.system_tests false
      g.test_framework :rspec
      g.orm :active_record, fixture: true
      g.helper false
      g.stylesheets false
      g.factory_bot filename_proc: -> (table_name) { "#{table_name.singularize}_factory" }
    end

    # Set the secret key base from the config
    config.secret_key_base = ExampleApp.config.rails.secret_key_base

    # Set the encryption keys for Active Record
    config.active_record.encryption.primary_key = ExampleApp.config.encryption.primary_key
    config.active_record.encryption.deterministic_key = ExampleApp.config.encryption.deterministic_key
    config.active_record.encryption.key_derivation_salt = ExampleApp.config.encryption.key_derivation_salt

    # Set the default encoding for serialized fields to YAML
    config.active_record.default_column_serializer = YAML

    # Set the queue adapter to use Sidekiq
    config.active_job.queue_adapter = :sidekiq

  end
end
