# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Tank Parameters Management', type: :system do
  let(:user) { create(:user) }
  let(:tank) { create(:tank, user:) }

  before do
    sign_in user
  end

  it 'allows the user to add and delete tank parameters' do
    visit tank_parameters_path(tank)

    within('#tank_parameters_form') do
      fill_in 'Date', with: Date.today
      fill_in 'PH', with: '8.1'
      fill_in 'Temp (F)', with: '78'
      fill_in 'Salinity (d SG)', with: '1.025'
      fill_in 'Alkalinity (dKH)', with: '9'
      fill_in 'Ammonia (ppm)', with: '0.0'
      fill_in 'Nitrite (ppm)', with: '0.0'
      fill_in 'Nitrate (ppm)', with: '5.0'
      fill_in 'Phosphate (ppm)', with: '0.03'
      fill_in 'Calcium (ppm)', with: '420'
      fill_in 'Magnesium (ppm)', with: '1350'

      click_button 'Add Parameter'
    end

    expect(page).to have_content('Parameters for')
    expect(page).to have_content('8.1')
    expect(page).to have_content('78')
    expect(page).to have_content('1.025')
    expect(page).to have_content('9')

    within('#tank_parameters') do
      accept_alert { click_on 'Delete' }
    end

    expect(page).not_to have_content('Parameters for')
    expect(page).to have_content('Tank Parameters')
  end
end
