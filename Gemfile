# frozen_string_literal: true

source "https://rubygems.org"

ruby "3.3.1"

gem "authie", ">= 4", "< 5"
gem "bootsnap", require: false
gem "cssbundling-rails"
gem "dotenv-rails"
gem "jsbundling-rails"
gem "klogger-logger"
gem "konfig-config", "~> 3.0"
gem "pg"
gem "prometheus-client"
gem "propshaft"
gem "puma", ">= 5.0"
gem "rails", "~> 7.1.3", ">= 7.1.3.2"
gem "sentry-rails"
gem "sentry-ruby"
gem "sentry-sidekiq"
gem "sidekiq"
gem "stimulus-rails"
gem "turbo-rails"
gem "view_component"
gem "webrick"

group :development do
  gem "rubocop"
  gem "rubocop-factory_bot"
  gem "rubocop-performance"
  gem "rubocop-rails"
  gem "rubocop-rspec"
end

group :development, :test do
  gem "factory_bot_rails"
end

group :test do
  gem "database_cleaner"
  gem "rails-controller-testing"
  gem "rspec"
  gem "rspec-rails"
  gem "shoulda-matchers"
  gem "timecop"
  gem "webmock"
end
