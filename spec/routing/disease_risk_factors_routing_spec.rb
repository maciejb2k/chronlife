require "rails_helper"

RSpec.describe DiseaseRiskFactorsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/disease_risk_factors").to route_to("disease_risk_factors#index")
    end

    it "routes to #new" do
      expect(get: "/disease_risk_factors/new").to route_to("disease_risk_factors#new")
    end

    it "routes to #show" do
      expect(get: "/disease_risk_factors/1").to route_to("disease_risk_factors#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/disease_risk_factors/1/edit").to route_to("disease_risk_factors#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/disease_risk_factors").to route_to("disease_risk_factors#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/disease_risk_factors/1").to route_to("disease_risk_factors#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/disease_risk_factors/1").to route_to("disease_risk_factors#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/disease_risk_factors/1").to route_to("disease_risk_factors#destroy", id: "1")
    end
  end
end
