require "rails_helper"

RSpec.describe DiseaseSymptomUpdatesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/disease_symptom_updates").to route_to("disease_symptom_updates#index")
    end

    it "routes to #new" do
      expect(get: "/disease_symptom_updates/new").to route_to("disease_symptom_updates#new")
    end

    it "routes to #show" do
      expect(get: "/disease_symptom_updates/1").to route_to("disease_symptom_updates#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/disease_symptom_updates/1/edit").to route_to("disease_symptom_updates#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/disease_symptom_updates").to route_to("disease_symptom_updates#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/disease_symptom_updates/1").to route_to("disease_symptom_updates#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/disease_symptom_updates/1").to route_to("disease_symptom_updates#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/disease_symptom_updates/1").to route_to("disease_symptom_updates#destroy", id: "1")
    end
  end
end
