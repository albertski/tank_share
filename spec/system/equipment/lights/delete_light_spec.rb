# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Delete Light', type: :system do
  let(:user)   { create(:user) }
  let(:tank)   { create(:tank, user: user) }
  let!(:light) { create(:light, tank: tank) }

  before { sign_in user }

  it 'allows you to delete a light' do
    visit tank_equipments_path(tank)
    assert_text light.equipment.title

    click_on 'Delete'

    assert_no_text light.equipment.title
  end
end
