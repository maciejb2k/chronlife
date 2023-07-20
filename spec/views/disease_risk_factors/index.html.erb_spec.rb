require 'rails_helper'

RSpec.describe "disease_risk_factors/index", type: :view do
  before(:each) do
    assign(:disease_risk_factors, [
      DiseaseRiskFactor.create!(
        name: "Name",
        description: "MyText",
        severity: 2,
        disease: nil
      ),
      DiseaseRiskFactor.create!(
        name: "Name",
        description: "MyText",
        severity: 2,
        disease: nil
      )
    ])
  end

  it "renders a list of disease_risk_factors" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
