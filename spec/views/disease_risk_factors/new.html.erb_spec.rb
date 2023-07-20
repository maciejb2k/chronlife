require 'rails_helper'

RSpec.describe "disease_risk_factors/new", type: :view do
  before(:each) do
    assign(:disease_risk_factor, DiseaseRiskFactor.new(
      name: "MyString",
      description: "MyText",
      severity: 1,
      disease: nil
    ))
  end

  it "renders new disease_risk_factor form" do
    render

    assert_select "form[action=?][method=?]", disease_risk_factors_path, "post" do

      assert_select "input[name=?]", "disease_risk_factor[name]"

      assert_select "textarea[name=?]", "disease_risk_factor[description]"

      assert_select "input[name=?]", "disease_risk_factor[severity]"

      assert_select "input[name=?]", "disease_risk_factor[disease_id]"
    end
  end
end
