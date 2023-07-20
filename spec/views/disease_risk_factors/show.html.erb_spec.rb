require 'rails_helper'

RSpec.describe "disease_risk_factors/show", type: :view do
  before(:each) do
    assign(:disease_risk_factor, DiseaseRiskFactor.create!(
      name: "Name",
      description: "MyText",
      severity: 2,
      disease: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(//)
  end
end
