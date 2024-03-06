# frozen_string_literal: true

Sentry.init do |config|
  config.dsn = 'https://b75fe40a1bedbd1153253f25b8ce1068@o4506861972160512.ingest.us.sentry.io/4506862069678080'
  config.breadcrumbs_logger = %i[active_support_logger http_logger]
  Rails.logger.info('sentry configurations')
  # Set traces_sample_rate to 1.0 to capture 100%
  # of transactions for performance monitoring.
  # We recommend adjusting this value in production.
  config.traces_sample_rate = 1.0
  # or
  config.traces_sampler = lambda do |_context|
    true
  end
end
