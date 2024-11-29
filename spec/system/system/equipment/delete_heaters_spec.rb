# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Delete Heaters', type: :system do
  let(:user)    { create(:user) }
  let(:tank)    { create(:tank, user: user) }
  let!(:heater) { create(:heater, tank: tank) }

  before { sign_in user }

  it 'allows you to create a heater' do
    visit tank_equipments_path(tank)
    assert_text heater.equipment.title

    click_on 'Delete'

    assert_no_text heater.equipment.title
  end
end
