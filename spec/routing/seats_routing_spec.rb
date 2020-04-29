require "rails_helper"

RSpec.describe SeatsController, type: :routing do
  describe "routing" do
    it "routes to #update via PATCH" do
      expect(patch: "/venues/vanue1/seats/a1").to route_to("seats#update", id: "vanue1", seat_id: "a1")
    end
  end
end
