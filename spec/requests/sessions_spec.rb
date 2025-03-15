require 'rails_helper'

RSpec.describe "/sessions", type: :request do
  describe "GET /login" do
    it "renders a successful response" do
      get login_url
      expect(response).to be_successful
    end
  end

  describe "GET /logout" do
    it "renders a successful response" do
      get logout_url
      expect(response).to be_successful
    end
  end
end
