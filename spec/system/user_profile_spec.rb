# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User Profile', type: :system do
  context 'when user visits user profile page' do
    before { visit users_profile_path }

    context 'when user is not signed in' do
      before { click_on 'Sign up' }

      let(:first_name) { Faker::Name.first_name }

      context 'user creates a new account' do
        before do
          fill_in 'user_email', with: Faker::Internet.email
          fill_in 'user_password', with: password
          fill_in 'user_password_confirmation', with: password
          click_button 'Sign up'
          fill_in 'user_first_name', with: first_name
          click_button 'Save'
          fill_in 'user_last_name', with: Faker::Name.last_name
          click_button 'Save'
          fill_in 'user_city', with: Faker::Address.city
          click_button 'Save'
          fill_in 'user_province', with: Faker::Address.state
          click_button 'Save'
          fill_in 'user_postal_code', with: Faker::Address.postcode
          click_button 'Save'
          select 'United States', from: 'user_country'
          click_button 'Save'
          fill_in 'user_years_tanking', with: 2
          click_button 'Save'
          select 'Advanced', from: 'user_level'
          click_button 'Save'
        end

        let(:password) { Faker::Internet.password }

        it 'saves the first name' do
          expect(User.first.first_name).not_to be_empty
          expect(User.first.last_name).not_to be_empty
          expect(User.first.city).not_to be_empty
          expect(User.first.province).not_to be_empty
          expect(User.first.postal_code).not_to be_empty
          expect(User.first.country).not_to be_empty
          expect(User.first.years_tanking).not_to be_nil
          expect(User.first.level).not_to be_nil
          expect(page).to have_content("Welcome #{first_name}")
        end
      end
    end
  end
end
