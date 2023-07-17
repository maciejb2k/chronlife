require 'rails_helper'

RSpec.describe "disease_symptoms/edit", type: :view do
  let(:disease_symptom) {
    DiseaseSymptom.create!(
      description: "MyText",
      disease: nil,
      predefined_symptom: nil
    )
  }

  before(:each) do
    assign(:disease_symptom, disease_symptom)
  end

  it "renders the edit disease_symptom form" do
    render

    assert_select "form[action=?][method=?]", disease_symptom_path(disease_symptom), "post" do

      assert_select "textarea[name=?]", "disease_symptom[description]"

      assert_select "input[name=?]", "disease_symptom[disease_id]"

      assert_select "input[name=?]", "disease_symptom[predefined_symptom_id]"
    end
  end
end
