# frozen_string_literal: true

module ExampleApp

  class << self

    LEVELS = {
      "debug" => Logger::DEBUG,
      "info" => Logger::INFO,
      "warn" => Logger::WARN,
      "error" => Logger::ERROR,
      "fatal" => Logger::FATAL
    }.freeze

    def logger
      @logger ||= begin
        k = Klogger.new(nil, destination: config.log.enabled? ? $stdout : "/dev/null",
                             highlight: config.log.highlighting_enabled?)
        k.level = LEVELS[config.log.level]
        k
      end
    end

  end

end
