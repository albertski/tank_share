# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Update Coral', type: :system do
  let(:user)  { create(:user) }
  let(:tank)  { create(:tank, user: user) }
  let!(:coral) { create(:fish, tank: tank) }

  before { sign_in user }

  it 'allows you to update a coral' do
    visit tank_livestocks_path(tank)
    assert_text coral.livestock.name

    find('.edit').click

    fill_in 'Name', with: 'Updated Name Here'
    click_on 'Save'

    assert_text 'Updated Name Here'
  end
end
