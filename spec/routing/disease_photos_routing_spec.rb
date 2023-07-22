require "rails_helper"

RSpec.describe DiseasePhotosController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/disease_photos").to route_to("disease_photos#index")
    end

    it "routes to #new" do
      expect(get: "/disease_photos/new").to route_to("disease_photos#new")
    end

    it "routes to #show" do
      expect(get: "/disease_photos/1").to route_to("disease_photos#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/disease_photos/1/edit").to route_to("disease_photos#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/disease_photos").to route_to("disease_photos#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/disease_photos/1").to route_to("disease_photos#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/disease_photos/1").to route_to("disease_photos#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/disease_photos/1").to route_to("disease_photos#destroy", id: "1")
    end
  end
end
