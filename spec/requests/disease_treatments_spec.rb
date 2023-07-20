require 'rails_helper'

RSpec.describe "DiseaseTreatments", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/disease_treatments/index"
      expect(response).to have_http_status(:success)
    end
  end

end
