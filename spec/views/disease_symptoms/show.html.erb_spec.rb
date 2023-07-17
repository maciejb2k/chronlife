require 'rails_helper'

RSpec.describe "disease_symptoms/show", type: :view do
  before(:each) do
    assign(:disease_symptom, DiseaseSymptom.create!(
      description: "MyText",
      disease: nil,
      predefined_symptom: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
