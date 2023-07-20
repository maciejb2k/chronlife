require 'rails_helper'

RSpec.describe "TreatmentDiseases", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/treatment_disease/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/treatment_disease/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/treatment_disease/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
