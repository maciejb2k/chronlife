require 'rails_helper'

RSpec.describe "treatment_updates/index", type: :view do
  before(:each) do
    assign(:treatment_updates, [
      TreatmentUpdate.create!(
        name: "Name",
        status: "Status",
        description: "MyText",
        treatment: nil
      ),
      TreatmentUpdate.create!(
        name: "Name",
        status: "Status",
        description: "MyText",
        treatment: nil
      )
    ])
  end

  it "renders a list of treatment_updates" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Status".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
