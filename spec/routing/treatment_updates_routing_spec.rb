require "rails_helper"

RSpec.describe TreatmentUpdatesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/treatment_updates").to route_to("treatment_updates#index")
    end

    it "routes to #new" do
      expect(get: "/treatment_updates/new").to route_to("treatment_updates#new")
    end

    it "routes to #show" do
      expect(get: "/treatment_updates/1").to route_to("treatment_updates#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/treatment_updates/1/edit").to route_to("treatment_updates#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/treatment_updates").to route_to("treatment_updates#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/treatment_updates/1").to route_to("treatment_updates#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/treatment_updates/1").to route_to("treatment_updates#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/treatment_updates/1").to route_to("treatment_updates#destroy", id: "1")
    end
  end
end
