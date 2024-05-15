# frozen_string_literal: true

begin
  config = ExampleApp.config.sentry
  if config.dsn.present?
    Sentry.init do |c|
      c.dsn = config.dsn
      c.breadcrumbs_logger = [:active_support_logger, :http_logger]
      c.traces_sample_rate = config.traces_sample_rate
      c.release = ExampleApp.version
      c.logger = ExampleApp.logger.create_tagged_logger(component: "sentry")
    end
  end
end
