# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Update Fish', type: :system do
  let(:user)  { create(:user) }
  let(:tank)  { create(:tank, user: user) }
  let!(:fish) { create(:fish, tank: tank) }

  before { sign_in user }

  it 'allows you to update a fish' do
    visit tank_livestocks_path(tank)
    assert_text fish.livestock.name

    find('.edit').click

    fill_in 'Name', with: 'Updated Name Here'
    click_on 'Save'

    assert_text 'Updated Name Here'
  end
end
