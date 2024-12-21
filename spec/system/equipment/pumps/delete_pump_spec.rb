# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Delete Light', type: :system do
  let(:user)  { create(:user) }
  let(:tank)  { create(:tank, user: user) }
  let!(:pump) { create(:pump, tank: tank) }

  before { sign_in user }

  it 'allows you to delete a pump' do
    visit tank_equipments_path(tank)
    assert_text pump.equipment.title

    find('.delete').click

    assert_no_text pump.equipment.title
  end
end
