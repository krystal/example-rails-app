# frozen_string_literal: true

# This initializer will wait for all pending migrations to be applied before
# continuing to start the application. This is useful when running the application
# in a cluster where migrations are run in a separate job which runs at the same
# time as the other processes.

# rubocop:disable Rails/Output
class MigrationWaiter

  ATTEMPTS = ExampleApp.config.wait_for_migrations.attempts
  SLEEP_TIME = ExampleApp.config.wait_for_migrations.sleep_time

  class << self

    def wait
      attempts_remaining = ATTEMPTS
      loop do
        pending_migrations = ActiveRecord::Base.connection.migration_context.open.pending_migrations.size
        if pending_migrations.zero?
          puts "No pending migrations, continuing"
          return
        end

        attempts_remaining -= 1

        if attempts_remaining.zero?
          puts "#{pending_migrations} migration(s) are still pending after #{ATTEMPTS} attempts, exiting"
          Process.exit(1) # rubocop:disable Rails/Exit
        else
          puts "Waiting for #{pending_migrations} migration(s) to be applied (#{attempts_remaining} remaining)"
          sleep SLEEP_TIME
        end
      end
    end

    def wait_if_appropriate
      # Don't wait if not configured
      return unless ExampleApp.config.wait_for_migrations.enabled?

      # Don't wait in the console, rake tasks or rails commands
      return if console? || rake_task? || rails_command?

      wait
    end

    def console?
      Rails.const_defined?(:Console)
    end

    def rake_task?
      defined?(Rake) && Rake.application.top_level_tasks.any?
    end

    def rails_command?
      caller.any? { |c| c.include?("rails/commands") }
    end

  end

end

MigrationWaiter.wait_if_appropriate
# rubocop:enable Rails/Output
