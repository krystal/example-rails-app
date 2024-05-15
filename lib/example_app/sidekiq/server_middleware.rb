# frozen_string_literal: true

module ExampleApp
  module Sidekiq
    class ServerMiddleware

      def call(worker, job, queue, &)
        ActiveSupport::Notifications.instrument("job_perform.sidekiq",
                                                class: worker.class,
                                                queue:,
                                                job:,
                                                &)
      end

    end
  end
end
