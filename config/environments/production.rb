# Force SSL in production
config.force_ssl = true

# Use a CDN if available
# config.action_controller.asset_host = ENV['ASSET_HOST']

# Log to STDOUT in production for Render
config.logger = ActiveSupport::Logger.new(STDOUT)
config.logger.formatter = config.log_formatter
config.log_tags = [:request_id] 