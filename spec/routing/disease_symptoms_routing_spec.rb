require "rails_helper"

RSpec.describe DiseaseSymptomsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/disease_symptoms").to route_to("disease_symptoms#index")
    end

    it "routes to #new" do
      expect(get: "/disease_symptoms/new").to route_to("disease_symptoms#new")
    end

    it "routes to #show" do
      expect(get: "/disease_symptoms/1").to route_to("disease_symptoms#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/disease_symptoms/1/edit").to route_to("disease_symptoms#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/disease_symptoms").to route_to("disease_symptoms#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/disease_symptoms/1").to route_to("disease_symptoms#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/disease_symptoms/1").to route_to("disease_symptoms#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/disease_symptoms/1").to route_to("disease_symptoms#destroy", id: "1")
    end
  end
end
