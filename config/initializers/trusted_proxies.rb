# frozen_string_literal: true

Rack::Request.ip_filter = lambda { |ip|
  if ExampleApp.config.example_app.trusted_proxies&.any? { |net| net.include?(ip) }
    true
  else
    false
  end
}
