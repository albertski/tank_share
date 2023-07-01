# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EmailSignupThankYouEmailJob, type: :job do
  let(:email_signup) { create(:email_signup) }

  it 'calls the mailer with the correct arguments' do
    expect(EmailSignupThankYouMailer).to receive(:send_email)
      .with(email_signup).and_return(double('mailer', deliver_now: true))

    perform_enqueued_jobs do
      EmailSignupThankYouEmailJob.perform_later(email_signup)
    end
  end
end
