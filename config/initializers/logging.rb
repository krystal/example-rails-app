# frozen_string_literal: true

begin
  ActiveSupport::Notifications.subscribe "process_action.action_controller" do |*args|
    event = ActiveSupport::Notifications::Event.new(*args)

    payload = {
      event: "request",
      transaction: event.transaction_id,
      controller: event.payload[:controller],
      action: event.payload[:action],
      format: event.payload[:format],
      method: event.payload[:method],
      path: event.payload[:path],
      request_id: event.payload[:request].request_id,
      ip_address: event.payload[:request].ip,
      status: event.payload[:status],
      view_runtime: event.payload[:view_runtime],
      db_runtime: event.payload[:db_runtime]
    }

    add_exception_to_payload(payload, event)

    string = "#{payload[:method]} #{payload[:path]} (#{payload[:status]})"

    if payload[:exception_class]
      ExampleApp.logger.error(string, **payload)
    else
      ExampleApp.logger.info(string, **payload)
    end
  end

  ActiveSupport::Notifications.subscribe "job_perform.sidekiq" do |*args|
    event = ActiveSupport::Notifications::Event.new(*args)

    payload = {
      event: "perform_job",
      transaction: event.transaction_id,
      job_class: event.payload[:class],
      queue: event.payload[:queue],
      job_id: event.payload[:job]["jid"],
      duration: event.duration,
      args: event.payload[:job]["args"].inspect
    }
    add_exception_to_payload(payload, event)
    if payload[:exception_class]
      ExampleApp.logger.error(payload)
    else
      ExampleApp.logger.info(payload)
    end
  end

  ActiveSupport::Notifications.subscribe "job_queue.sidekiq" do |*args|
    event = ActiveSupport::Notifications::Event.new(*args)

    payload = {
      event: "queue_job",
      transaction: event.transaction_id,
      job_class: event.payload[:class],
      queue: event.payload[:queue],
      job_id: event.payload[:job]["jid"],
      args: event.payload[:job]["args"].inspect
    }
    ExampleApp.logger.info(payload)
  end

  def add_exception_to_payload(payload, event)
    return unless exception = event.payload[:exception_object]

    payload[:exception_class] = exception.class.name
    payload[:exception_message] = exception.message
    payload[:exception_backtrace] = exception.backtrace[0, 4].join("\n")
  end
end
