# frozen_string_literal: true

require "example_app/sidekiq/server_middleware"
require "example_app/sidekiq/client_middleware"
require "example_app/health_server"

Sidekiq.configure_server do |config|
  config.redis = { url: ExampleApp.redis_url }

  config.client_middleware do |chain|
    chain.add ExampleApp::Sidekiq::ClientMiddleware
  end

  config.server_middleware do |chain|
    chain.add ExampleApp::Sidekiq::ServerMiddleware
  end

  config.on :startup do
    ExampleApp::HealthServer.start(
      name: "worker",
      default_port: ExampleApp.config.worker.default_health_server_port,
      default_bind_address: ExampleApp.config.worker.default_health_server_bind_address
    )
  end
end

Sidekiq.configure_client do |config|
  config.redis = { url: ExampleApp.redis_url }
  config.client_middleware do |chain|
    chain.add ExampleApp::Sidekiq::ClientMiddleware
  end
end
