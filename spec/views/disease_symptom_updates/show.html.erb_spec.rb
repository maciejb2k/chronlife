require 'rails_helper'

RSpec.describe "disease_symptom_updates/show", type: :view do
  before(:each) do
    assign(:disease_symptom_update, DiseaseSymptomUpdate.create!(
      intensity: 2,
      disease_symptom: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(//)
  end
end
