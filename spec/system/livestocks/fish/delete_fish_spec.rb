# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Delete Fish', type: :system do
  let(:user)  { create(:user) }
  let(:tank)  { create(:tank, user: user) }
  let!(:fish) { create(:fish, tank: tank) }

  before { sign_in user }

  it 'allows you to delete a fish' do
    visit tank_livestocks_path(tank)
    assert_text fish.livestock.name

    find('.delete').click

    assert_no_text fish.livestock.name
  end
end
