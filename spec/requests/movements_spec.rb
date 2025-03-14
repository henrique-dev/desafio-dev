require 'rails_helper'

RSpec.describe "/movements", type: :request do
  let(:store) { create(:store) }
  let(:valid_attributes) { attributes_for(:movement) }

  describe "GET /index" do
    it "renders a successful response" do
      create(:movement, store:, **valid_attributes)
      get store_movements_url(store)
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      movement = create(:movement, store:, **valid_attributes)
      get store_movement_url(store, movement)
      expect(response).to be_successful
    end
  end
end
