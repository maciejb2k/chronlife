require 'rails_helper'

RSpec.describe "disease_symptoms/index", type: :view do
  before(:each) do
    assign(:disease_symptoms, [
      DiseaseSymptom.create!(
        description: "MyText",
        disease: nil,
        predefined_symptom: nil
      ),
      DiseaseSymptom.create!(
        description: "MyText",
        disease: nil,
        predefined_symptom: nil
      )
    ])
  end

  it "renders a list of disease_symptoms" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
