# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Unfollow user', type: :system do
  context 'when visiting a tank page that you already follow the user' do
    let(:user) { create(:user) }
    let(:tank) { create(:tank) }
    let!(:follow) { create(:follow, follower: user, followed: tank.user) }

    before do
      sign_in user
      visit tank_path(tank)
    end

    it 'has unfollow button and counts' do
      assert_text 'Unfollow'
      assert_text '0 Following'
      assert_text '1 Follower'
    end

    context 'when clicking on unfollow' do
      before { click_on 'Unfollow' }

      it 'Updates the follower count and updates the button to unfollow' do
        assert_text 'Follow'
        assert_text '0 Followers'
      end
    end
  end
end
