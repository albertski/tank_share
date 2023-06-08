# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Signup', type: :system do
  context 'when user visits signup page' do
    before { visit signup_path }

    RSpec.shared_examples 'does not create email signup' do
      it do
        expect do
          click_on 'Sign Up'
          expect(page).to have_content('An error occurred. Please try again.')
        end.to change(EmailSignup, :count).by(0)
      end
    end

    context 'and user fills out first name, last name, and email' do
      before do
        fill_in 'First Name', with: 'John'
        fill_in 'Last Name', with: 'Doe'
        fill_in 'Email', with: 'john@example.com'
        check 'email_signup_agree'
      end

      context 'and email does not exist' do
        it do
          expect do
            click_on 'Sign Up'
            expect(page).to have_content('Thank you John for signing up!')
          end.to change(EmailSignup, :count).by(1)
        end
      end

      context 'and agree is unchecked' do
        before { uncheck 'email_signup_agree' }

        include_examples 'does not create email signup'
      end

      context 'and email already exists' do
        let!(:email_signup) do
          create(:email_signup, email: 'john@example.com', agree: true)
        end

        include_examples 'does not create email signup'
      end
    end
  end
end
