require 'rails_helper'

RSpec.describe "disease_symptom_updates/edit", type: :view do
  let(:disease_symptom_update) {
    DiseaseSymptomUpdate.create!(
      intensity: 1,
      disease_symptom: nil
    )
  }

  before(:each) do
    assign(:disease_symptom_update, disease_symptom_update)
  end

  it "renders the edit disease_symptom_update form" do
    render

    assert_select "form[action=?][method=?]", disease_symptom_update_path(disease_symptom_update), "post" do

      assert_select "input[name=?]", "disease_symptom_update[intensity]"

      assert_select "input[name=?]", "disease_symptom_update[disease_symptom_id]"
    end
  end
end
