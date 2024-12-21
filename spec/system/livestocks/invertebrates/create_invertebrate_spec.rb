# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Create Invertebrate', type: :system do
  let(:user) { create(:user) }
  let(:tank) { create(:tank, user: user) }

  before { sign_in user }

  it 'allows you to create a invertebrates' do
    visit tank_livestocks_path(tank)
    assert_selector 'h2', text: 'Invertebrates'

    click_on 'Add Invertebrate'

    fill_in 'Name', with: 'Bulk Reef Supply'
    fill_in 'Purchase date', with: '12/01/2021'
    fill_in 'Quantity', with: 4

    click_on 'Save'

    assert_text 'Bulk Reef Supply'
    assert_text '4'
  end
end
