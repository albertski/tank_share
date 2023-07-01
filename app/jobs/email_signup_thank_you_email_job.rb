# frozen_string_literal: true

class EmailSignupThankYouEmailJob < ApplicationJob
  queue_as :default

  def perform(email_signup)
    EmailSignupThankYouMailer.send_email(email_signup).deliver_now
  end
end
