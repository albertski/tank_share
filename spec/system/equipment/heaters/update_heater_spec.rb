# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Update Heater', type: :system do
  let(:user)    { create(:user) }
  let(:tank)    { create(:tank, user: user) }
  let!(:heater) { create(:heater, tank: tank) }

  before { sign_in user }

  it 'allows you to update a heater' do
    visit tank_equipments_path(tank)
    assert_text heater.equipment.title

    find('.edit').click

    fill_in 'Title', with: 'Updated Title Here'
    click_on 'Save Equipment'

    assert_text 'Updated Title Here'
  end
end
