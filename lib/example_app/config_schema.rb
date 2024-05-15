# frozen_string_literal: true

require "konfig/schema"

module ExampleApp

  ConfigSchema = Konfig::Schema.draw do
    group :example_app do
      string :web_hostname do
        description "The hostname the ExampleApp web service listens on"
        default "example.localhost"
      end

      string :web_protocol do
        description "The protocol the ExampleApp web service listens on"
        default "https"
      end

      string :trusted_proxies do
        description "A list of IP addresses of hosts which are permitted to proxy traffic to the application"
        array
        default ["127.0.0.1", "::1"]
        transform { |ip| IPAddr.new(ip) }
      end
    end

    group :postgres do
      string :host do
        description "The hostname of the Postgres server"
        default "127.0.0.1"
      end

      integer :port do
        description "The port the Postgres server listens on"
        default 5432
      end

      string :username do
        description "The username to connect to the Postgres server"
        default "postgres"
      end

      string :password do
        description "The password to connect to the Postgres server"
      end

      string :database_name do
        description "The database to connect to"
        default "example"
      end

      string :test_database_name do
        description "The database to use when running in the test environment"
        default "example_test"
      end

      string :encoding do
        description "The encoding to use when connecting to the Postgres server"
        default "unicode"
      end

      integer :pool_size do
        description "The maximum size of the Postgres connection pool"
        default 10
      end
    end

    group :redis do
      string :host do
        description "The host that the Redis server is running on"
        default "127.0.0.1"
      end

      integer :port do
        description "The port that the Redis server is running on"
        default 6379
      end

      string :password do
        description "The password to use when connecting to the Redis server"
      end

      integer :database do
        description "The database to use"
        default 0
      end
    end

    group :worker do
      integer :default_health_server_port do
        description "The default port the worker health server will listen on"
        default 3001
      end

      string :default_health_server_bind_address do
        description "The default bind address the worker health server will listen on"
        default "0.0.0.0"
      end
    end

    group :web_server do
      integer :default_port do
        description "The default port the web server will listen on"
        default 3000
      end

      string :default_bind_address do
        description "The default bind address the web server will listen on"
        default "127.0.0.1"
      end

      integer :max_threads do
        description "The maximum number of threads the web server will use"
        default 5
      end

      boolean :concurrency do
        description "Should concurrency be enabled for the web server?"
        default false
      end
    end

    group :rails do
      string :env do
        description "The environment Rails is running in"
        default "development"
      end

      string :secret_key_base do
        description "The secret key base for the Rails application"
      end
    end

    group :encryption do
      string :primary_key do
        description "The primary key to use for encryption"
        default "insecure"
      end

      string :deterministic_key do
        description "The deterministic key to use for encryption"
        default "insecure"
      end

      string :key_derivation_salt do
        description "The salt to use for key derivation"
        default "insecure"
      end
    end

    group :log do
      boolean :rails do
        description "Enable the default Rails logger"
        default false
      end

      boolean :enabled do
        description "Enable the ExampleApp logger to log to STDOUT"
        default true
      end

      string :level do
        description "The log level to use"
        default "info"
      end

      boolean :highlighting_enabled do
        description "Enable highlighting of log lines"
        default false
      end
    end

    group :sentry do
      string :dsn do
        description "A DSN which should be used to report exceptions to Sentry"
      end

      float :traces_sample_rate do
        description "The rate at which traces should be sampled"
        default 1.0
      end
    end

    group :wait_for_migrations do
      boolean :enabled do
        description "If enabled, application will wait for all migrations to be applied before starting"
        default false
      end

      integer :sleep_time do
        description "How many seconds should sleep between checking for migrations"
        default 1
      end

      integer :attempts do
        description "How many attempts should be made to check for migrations"
        default 60
      end
    end
  end

end
