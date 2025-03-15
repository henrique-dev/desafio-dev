require 'rails_helper'

RSpec.describe '/omniauth_callbacks', type: :request do
  let(:user) { create(:user) }
  let(:valid_attributes) {}
  let(:invalid_attributes) {}

  before do
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new(
      provider: user.provider,
      uid: user.uid,
      info: {
        name: user.name,
        email: user.email
      },
      credentials: {
        token: 'mock_token',
        refresh_token: 'mock_refresh_token',
        expires_at: Time.now + 1.hour
      }
    )
  end

  after do
    OmniAuth.config.mock_auth[:google_oauth2] = nil
    OmniAuth.config.test_mode = false
  end

  describe 'GET /google_oauth2' do
    it 'renders a successful response' do
      get auth_google_oauth2_callback_url
      expect(response).to redirect_to(new_importer_path)
    end
  end
end
