# frozen_string_literal: true

require 'rails_helper'

RSpec.shared_examples 'a controller that sets the current user' do
  describe 'before_action set_current_user' do
    let(:user) { create(:user) }

    before { allow(controller).to receive(:current_user).and_return(user) }

    it 'sets the current user in the Current module' do
      controller.send(:set_current_user)
      expect(Current.user).to eq(user)
    end
  end
end
