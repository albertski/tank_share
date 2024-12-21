# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Delete Coral', type: :system do
  let(:user)  { create(:user) }
  let(:tank)  { create(:tank, user: user) }
  let!(:coral) { create(:coral, tank: tank) }

  before { sign_in user }

  it 'allows you to delete a coral' do
    visit tank_livestocks_path(tank)
    assert_text coral.livestock.name

    find('.delete').click

    assert_no_text coral.livestock.name
  end
end
