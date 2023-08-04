require "rails_helper"

RSpec.describe MeasurementsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/measurements").to route_to("measurements#index")
    end

    it "routes to #new" do
      expect(get: "/measurements/new").to route_to("measurements#new")
    end

    it "routes to #show" do
      expect(get: "/measurements/1").to route_to("measurements#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/measurements/1/edit").to route_to("measurements#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/measurements").to route_to("measurements#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/measurements/1").to route_to("measurements#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/measurements/1").to route_to("measurements#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/measurements/1").to route_to("measurements#destroy", id: "1")
    end
  end
end
