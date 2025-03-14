require 'rails_helper'

RSpec.describe "/stores", type: :request do
  let(:valid_attributes) { attributes_for(:store) }

  describe "GET /index" do
    it "renders a successful response" do
      create(:store, **valid_attributes)
      get stores_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      store = create(:store, **valid_attributes)
      get store_url(store)
      expect(response).to be_successful
    end
  end
end
