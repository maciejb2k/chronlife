require 'rails_helper'

RSpec.describe "disease_symptoms/new", type: :view do
  before(:each) do
    assign(:disease_symptom, DiseaseSymptom.new(
      description: "MyText",
      disease: nil,
      predefined_symptom: nil
    ))
  end

  it "renders new disease_symptom form" do
    render

    assert_select "form[action=?][method=?]", disease_symptoms_path, "post" do

      assert_select "textarea[name=?]", "disease_symptom[description]"

      assert_select "input[name=?]", "disease_symptom[disease_id]"

      assert_select "input[name=?]", "disease_symptom[predefined_symptom_id]"
    end
  end
end
