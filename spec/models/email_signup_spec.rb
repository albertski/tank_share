# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EmailSignup, type: :model do
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:email) }

  it { should validate_absence_of(:phone_number) }

  context 'After saving' do
    let(:email_signup) { build(:email_signup) }

    it do
      expect { email_signup.save }
        .to have_enqueued_job(EmailSignupThankYouEmailJob)
    end
  end
end
