require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/disease_risk_factors", type: :request do
  
  # This should return the minimal set of attributes required to create a valid
  # DiseaseRiskFactor. As you add validations to DiseaseRiskFactor, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      DiseaseRiskFactor.create! valid_attributes
      get disease_risk_factors_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      disease_risk_factor = DiseaseRiskFactor.create! valid_attributes
      get disease_risk_factor_url(disease_risk_factor)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_disease_risk_factor_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      disease_risk_factor = DiseaseRiskFactor.create! valid_attributes
      get edit_disease_risk_factor_url(disease_risk_factor)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new DiseaseRiskFactor" do
        expect {
          post disease_risk_factors_url, params: { disease_risk_factor: valid_attributes }
        }.to change(DiseaseRiskFactor, :count).by(1)
      end

      it "redirects to the created disease_risk_factor" do
        post disease_risk_factors_url, params: { disease_risk_factor: valid_attributes }
        expect(response).to redirect_to(disease_risk_factor_url(DiseaseRiskFactor.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new DiseaseRiskFactor" do
        expect {
          post disease_risk_factors_url, params: { disease_risk_factor: invalid_attributes }
        }.to change(DiseaseRiskFactor, :count).by(0)
      end

    
      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post disease_risk_factors_url, params: { disease_risk_factor: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested disease_risk_factor" do
        disease_risk_factor = DiseaseRiskFactor.create! valid_attributes
        patch disease_risk_factor_url(disease_risk_factor), params: { disease_risk_factor: new_attributes }
        disease_risk_factor.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the disease_risk_factor" do
        disease_risk_factor = DiseaseRiskFactor.create! valid_attributes
        patch disease_risk_factor_url(disease_risk_factor), params: { disease_risk_factor: new_attributes }
        disease_risk_factor.reload
        expect(response).to redirect_to(disease_risk_factor_url(disease_risk_factor))
      end
    end

    context "with invalid parameters" do
    
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        disease_risk_factor = DiseaseRiskFactor.create! valid_attributes
        patch disease_risk_factor_url(disease_risk_factor), params: { disease_risk_factor: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested disease_risk_factor" do
      disease_risk_factor = DiseaseRiskFactor.create! valid_attributes
      expect {
        delete disease_risk_factor_url(disease_risk_factor)
      }.to change(DiseaseRiskFactor, :count).by(-1)
    end

    it "redirects to the disease_risk_factors list" do
      disease_risk_factor = DiseaseRiskFactor.create! valid_attributes
      delete disease_risk_factor_url(disease_risk_factor)
      expect(response).to redirect_to(disease_risk_factors_url)
    end
  end
end