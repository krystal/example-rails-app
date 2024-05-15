# frozen_string_literal: true

module ExampleApp
  module Sidekiq
    class ClientMiddleware

      def call(worker, job, queue, _, &)
        method = job["at"] ? "perform_in" : "perform_async"

        ActiveSupport::Notifications.instrument("job_queue.sidekiq",
                                                class: worker,
                                                method:,
                                                job:,
                                                queue:,
                                                &)
      end

    end
  end
end
