# frozen_string_literal: true

class EmailSignupThankYouMailer < ApplicationMailer
  def send_email(email_signup)
    @email_signup = email_signup
    mail(to: email_signup.email, subject: 'Thank You for Signing Up')
  end
end
