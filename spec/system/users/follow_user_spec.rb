# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Follow user', type: :system do
  context 'when visiting a tank page' do
    let(:user) { create(:user) }
    let(:tank) { create(:tank) }

    before do
      sign_in user
      visit tank_path(tank)
    end

    it 'has follow button and counts' do
      assert_text 'Follow'
      assert_text '0 Following'
      assert_text '0 Followers'
    end

    context 'when clicking on follow' do
      before { click_on 'Follow' }

      it 'Updates the follower count and updates the button to unfollow' do
        assert_text 'Unfollow'
        assert_text '1 Follower'
      end
    end
  end
end
