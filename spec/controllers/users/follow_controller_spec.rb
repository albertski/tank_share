require 'rails_helper'

RSpec.describe Users::FollowsController, type: :controller do
  let(:user) { create(:user) } # Create a user to be followed
  let(:current_user) { create(:user) } # The user who will perform the action

  before do
    sign_in current_user # Assuming you're using Devise for authentication
  end

  describe 'POST #create' do
    context 'when the follow action is successful' do
      it 'creates a new follow' do
        expect do
          post :create, params: { user_id: user.id }
        end.to change(Follow, :count).by(1)
      end

      it 'responds with turbo_stream' do
        post :create, params: { user_id: user.id }

        expect(response.media_type).to eq 'text/vnd.turbo-stream.html'
        expect(response.body).to include('user-follower-counts')
        expect(response.body).to include('user-follow-button')
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'when the user is already following the target user' do
      let!(:follow) { create(:follow, follower: current_user, followed: user) }

      it 'destroys the follow' do
        expect do
          delete :destroy, params: { user_id: user.id, id: follow.id }
        end.to change(Follow, :count).by(-1)
      end

      it 'responds with turbo_stream' do
        delete :destroy, params: { user_id: user.id, id: follow.id }

        expect(response.media_type).to eq 'text/vnd.turbo-stream.html'
        expect(response.body).to include('user-follower-counts')
        expect(response.body).to include('user-follow-button')
      end
    end

    context 'when the user is not following the target user' do
      let!(:follow) { create(:follow, followed: user) }

      it 'does not destroy a follow' do
        expect do
          delete :destroy, params: { user_id: user.id, id: follow.id }
        end.not_to change(Follow, :count)
      end
    end
  end
end
