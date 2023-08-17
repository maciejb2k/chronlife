require "rails_helper"

RSpec.describe Admin::SpecialistRequestsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/admin/specialist_requests").to route_to("admin/specialist_requests#index")
    end

    it "routes to #new" do
      expect(get: "/admin/specialist_requests/new").to route_to("admin/specialist_requests#new")
    end

    it "routes to #show" do
      expect(get: "/admin/specialist_requests/1").to route_to("admin/specialist_requests#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/admin/specialist_requests/1/edit").to route_to("admin/specialist_requests#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/admin/specialist_requests").to route_to("admin/specialist_requests#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/admin/specialist_requests/1").to route_to("admin/specialist_requests#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/admin/specialist_requests/1").to route_to("admin/specialist_requests#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/admin/specialist_requests/1").to route_to("admin/specialist_requests#destroy", id: "1")
    end
  end
end
