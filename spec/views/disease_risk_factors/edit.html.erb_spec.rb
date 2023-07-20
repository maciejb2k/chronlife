require 'rails_helper'

RSpec.describe "disease_risk_factors/edit", type: :view do
  let(:disease_risk_factor) {
    DiseaseRiskFactor.create!(
      name: "MyString",
      description: "MyText",
      severity: 1,
      disease: nil
    )
  }

  before(:each) do
    assign(:disease_risk_factor, disease_risk_factor)
  end

  it "renders the edit disease_risk_factor form" do
    render

    assert_select "form[action=?][method=?]", disease_risk_factor_path(disease_risk_factor), "post" do

      assert_select "input[name=?]", "disease_risk_factor[name]"

      assert_select "textarea[name=?]", "disease_risk_factor[description]"

      assert_select "input[name=?]", "disease_risk_factor[severity]"

      assert_select "input[name=?]", "disease_risk_factor[disease_id]"
    end
  end
end
