# Load the Rails application.
require_relative 'application'

# SendGrid
ActionMailer::Base.smtp_settings = {
  user_name: ENV['SENDGRID_USERNAME'],
  password: ENV['SENDGRID_PASSWORD'],
  domain: 'fullstck.io',
  address: 'smtp.sendgrid.net',
  port: 587,
  authentication: :plain,
  enable_starttls_auto: true
}

# Initialize the Rails application.
Rails.application.initialize!
