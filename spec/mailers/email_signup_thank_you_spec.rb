# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EmailSignupThankYouMailer, type: :mailer do
  describe '#send_email' do
    let(:email_signup) { create(:email_signup) }
    let(:mail) { described_class.send_email(email_signup) }

    it 'sends the email with the correct details' do
      expect(mail.to).to eq([email_signup.email])
      expect(mail.subject).to eq('Thank You for Signing Up')
    end

    it 'renders the body with the correct content' do
      expect(mail.body.encoded).to include('Thank you for signing up')
      expect(mail.body.encoded).to include(email_signup.first_name)
    end
  end
end
