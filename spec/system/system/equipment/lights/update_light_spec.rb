# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Update light', type: :system do
  let(:user)   { create(:user) }
  let(:tank)   { create(:tank, user: user) }
  let!(:light) { create(:light, tank: tank) }

  before { sign_in user }

  it 'allows you to update a light' do
    visit tank_equipments_path(tank)
    assert_text light.equipment.title

    click_on 'Edit'

    fill_in 'Title', with: 'Updated Title Here'
    click_on 'Save Equipment'

    assert_text 'Updated Title Here'
  end
end
