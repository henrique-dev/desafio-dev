require "rails_helper"

RSpec.describe MovementsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/stores/1/movements").to route_to("movements#index", store_id: '1')
    end

    it "routes to #show" do
      expect(get: "/stores/1/movements/1").to route_to("movements#show", id: "1", store_id: '1')
    end
  end
end
