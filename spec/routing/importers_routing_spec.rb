require "rails_helper"

RSpec.describe ImportersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/importers").to route_to("importers#index")
    end

    it "routes to #show" do
      expect(get: "/importers/1").to route_to("importers#show", id: '1')
    end

    it "routes to #new" do
      expect(get: "/importers/new").to route_to("importers#new")
    end

    it "routes to #create" do
      expect(post: "/importers").to route_to("importers#create")
    end
  end
end
