require 'rails_helper'

RSpec.describe TanksController, type: :controller do
  describe 'POST #create' do
    before do
      allow(controller).to receive(:current_user).and_return(current_user)
    end

    let(:current_user) { create(:user) }
    let(:valid_params) do
      {
        name: 'Test Tank',
        description: 'A test tank',
        total_volume_value: 100,
        total_volume_unit: 'liters',
        display_volume_value: 80,
        display_volume_unit: 'liters',
        sub_volume_value: 20,
        sub_volume_unit: 'liters',
        glass_thickness_value: 5,
        glass_thickness_unit: 'mm'
      }
    end

    context 'with valid parameters' do
      it 'creates a new tank' do
        expect { post :create, params: { tank: valid_params } }.to change(Tank, :count).by(1)
      end

      it "redirects to the created tank" do
        post :create, params: { tank: valid_params }
        expect(response).to redirect_to(Tank.last)
      end

      it "sets the user_id to the current user's id" do
        post :create, params: { tank: valid_params }
        expect(Tank.last.user_id).to eq(current_user.id)
      end

      it 'sets a success notice' do
        post :create, params: { tank: valid_params }
        expect(flash[:notice]).to eq('Tank was successfully created.')
      end
    end

    context 'with invalid parameters' do
      it 're-renders the :new template' do
        invalid_params = { test: '', one: '' }
        post :create, params: { tank: invalid_params }
        expect(response).to redirect_to(Tank.new)
      end
    end
  end
end
