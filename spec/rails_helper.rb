# frozen_string_literal: true

ENV["RAILS_ENV"] = "test"

require_relative "../config/environment"
require "rspec/rails"
require "spec_helper"
require "factory_bot"
require "timecop"
require "database_cleaner"
require "webmock/rspec"
require "shoulda-matchers"

Dir[File.expand_path("helpers/**/*.rb", __dir__)].each { |f| require f }
Dir[File.expand_path("**/shared/*.rb", __dir__)].each { |f| require f }

ActionMailer::Base.delivery_method = :test
ActiveRecord::Migration.maintain_test_schema!

require "sidekiq/testing"
Sidekiq::Testing.fake!
Sidekiq.configure_client do |config|
  config.logger = Logger.new("/dev/null")
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

RSpec.configure do |config|
  config.use_transactional_fixtures = true
  config.infer_spec_type_from _file_location!
  config.include FactoryBot::Syntax::Methods

  config.before(:each, type: :request) do
    host! ExampleApp.config.example_app.web_hostname
  end

  config.after do
    Sidekiq::Worker.clear_all
  end

  config.before(:suite) do
    DatabaseCleaner.start
    FactoryBot.lint
  ensure
    DatabaseCleaner.clean
  end
end
