# frozen_string_literal: true

require "konfig/config"
require "konfig/sources/environment"

require_relative "config_schema"

module ExampleApp

  class << self

    # Application configuration
    #
    # @return [Konfig::Config]
    def config
      @config ||= begin
        source = Konfig::Sources::Environment.new(ENV)
        Konfig::Config.build(ConfigSchema, sources: [source])
      end
    end

    # Change the connection pool size to the given size.
    #
    # @param new_size [Integer]
    # @return [void]
    def change_database_connection_pool_size(new_size)
      ActiveRecord::Base.connection_pool.disconnect!

      config = ActiveRecord::Base.configurations
                                 .configs_for(env_name: Rails.env)
                                 .first
                                 .configuration_hash

      ActiveRecord::Base.establish_connection(config.merge(pool: new_size))
    end

    # Return the Redis URL
    #
    # @return [String]
    def redis_url
      @redis_url ||= begin
        password_prefix = config.redis.password ? ":#{config.redis.password}@" : ""
        "redis://#{password_prefix}#{config.redis.host}:#{config.redis.port}/#{config.redis.database}"
      end
    end

  end

end
