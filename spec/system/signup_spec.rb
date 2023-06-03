# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Signup', type: :system do
  context 'when user visits signup page' do
    before { visit signup_path }

    context 'and user fills out first name, last name, and email' do
      before do
        fill_in 'First Name', with: 'John'
        fill_in 'Last Name', with: 'Doe'
        fill_in 'Email', with: 'john@example.com'
      end

      context 'and email does not exist already' do
        it do
          expect do
            click_on 'Sign Up'
            text = 'Thank you for signing up!'
            expect(page).to have_selector('#message', text)
          end.to change(EmailSignup, :count).by(1)
        end
      end
    end
  end
end
