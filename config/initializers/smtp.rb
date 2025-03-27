Rails.application.config.action_mailer.delivery_method = :smtp
Rails.application.config.action_mailer.smtp_settings = {
  address: 'smtp.gmail.com',
  port: 587,
  domain: 'gmail.com',
  user_name: Rails.application.credentials.dig(:gmail, :address),
  password: Rails.application.credentials.dig(:gmail, :app_password),
  authentication: :plain,
  enable_starttls_auto: true
} 