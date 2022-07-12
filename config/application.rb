Kogno::Application.configure do |config|

  config.app_name = "Travel Bot"

  config.environment = :development

  config.http_port = 3000

  config.default_locale = :en
  config.available_locales = [:en, :es]

  # Default context for any arrived message or event
  config.routes.default = :main

  config.sequences.time_elapsed_after_last_usage = 900 # 15 minutes

  config.store_log_in_database = false

  config.typed_postbacks = false

  config.error_notifier.slack = {
    enable: false,
    webhook: "<YOUR SLACK WEBHOOOK HERE>"
  }  

end

