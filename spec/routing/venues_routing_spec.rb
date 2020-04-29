require "rails_helper"

RSpec.describe VenuesController, type: :routing do
  describe "routing" do
    it "routes to #show" do
      expect(get: "/venues/1").to route_to("venues#show", id: "1")
    end

    it "routes to #create" do
      expect(post: "/venues").to route_to("venues#create")
    end
  end
end
