# frozen_string_literal: true

ActionMailer::Base.smtp_settings = {
  address: 'smtp-relay.sendinblue.com',
  port: 587,
  domain: 'tankshare.net',
  user_name: ENV['BREVO_USERNAME'],
  password: ENV['BREVO_PASSWORD'],
  authentication: :login,
  enable_starttls_auto: true
}
