# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Create Fish', type: :system do
  let(:user) { create(:user) }
  let(:tank) { create(:tank, user: user) }

  before { sign_in user }

  it 'allows you to create a fish' do
    visit tank_livestocks_path(tank)
    assert_selector 'h2', text: 'Fish'

    click_on 'Add Fish'

    fill_in 'Name', with: 'Bulk Reef Supply'
    fill_in 'Purchase date', with: '12/01/2021'
    fill_in 'Quantity', with: 4

    click_on 'Save'

    assert_text 'Bulk Reef Supply'
    assert_text '4'
  end
end
