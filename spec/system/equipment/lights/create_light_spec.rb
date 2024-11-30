# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Create Light', type: :system do
  let(:user) { create(:user) }
  let(:tank) { create(:tank, user: user) }

  before { sign_in user }

  it 'allows you to create a light' do
    visit tank_equipments_path(tank)
    assert_selector 'h2', text: 'Lighting'

    click_on 'Add Light'

    fill_in 'Manufacturer', with: 'Bulk Reef Supply'
    fill_in 'Title', with: 'Titanium Heater Element'
    fill_in 'Model', with: '1001H1'
    fill_in 'Quantity', with: 4

    click_on 'Save Equipment'

    assert_text 'Bulk Reef Supply'
    assert_text 'Titanium Heater Element'
    assert_text '1001H1'
    assert_text '4'
  end
end
