require 'rails_helper'

RSpec.describe "disease_symptom_updates/new", type: :view do
  before(:each) do
    assign(:disease_symptom_update, DiseaseSymptomUpdate.new(
      intensity: 1,
      disease_symptom: nil
    ))
  end

  it "renders new disease_symptom_update form" do
    render

    assert_select "form[action=?][method=?]", disease_symptom_updates_path, "post" do

      assert_select "input[name=?]", "disease_symptom_update[intensity]"

      assert_select "input[name=?]", "disease_symptom_update[disease_symptom_id]"
    end
  end
end
