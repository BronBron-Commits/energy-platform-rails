require "active_support/core_ext/integer/time"

Rails.application.configure do
  config.active_job.queue_adapter = :async
end
