require "rails_helper"

RSpec.describe DiseaseStatusesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/disease_statuses").to route_to("disease_statuses#index")
    end

    it "routes to #new" do
      expect(get: "/disease_statuses/new").to route_to("disease_statuses#new")
    end

    it "routes to #show" do
      expect(get: "/disease_statuses/1").to route_to("disease_statuses#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/disease_statuses/1/edit").to route_to("disease_statuses#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/disease_statuses").to route_to("disease_statuses#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/disease_statuses/1").to route_to("disease_statuses#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/disease_statuses/1").to route_to("disease_statuses#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/disease_statuses/1").to route_to("disease_statuses#destroy", id: "1")
    end
  end
end
