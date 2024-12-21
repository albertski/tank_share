# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Delete Invertebrate', type: :system do
  let(:user) { create(:user) }
  let(:tank) { create(:tank, user: user) }
  let!(:invertebrate) { create(:invertebrate, tank: tank) }

  before { sign_in user }

  it 'allows you to delete a invertebrates' do
    visit tank_livestocks_path(tank)
    assert_text invertebrate.livestock.name

    find('.delete').click

    assert_no_text invertebrate.livestock.name
  end
end
