require 'rails_helper'

RSpec.describe "Friends", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/friends/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/friends/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
