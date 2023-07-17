require 'rails_helper'

RSpec.describe "disease_symptom_updates/index", type: :view do
  before(:each) do
    assign(:disease_symptom_updates, [
      DiseaseSymptomUpdate.create!(
        intensity: 2,
        disease_symptom: nil
      ),
      DiseaseSymptomUpdate.create!(
        intensity: 2,
        disease_symptom: nil
      )
    ])
  end

  it "renders a list of disease_symptom_updates" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
