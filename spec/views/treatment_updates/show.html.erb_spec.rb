require 'rails_helper'

RSpec.describe "treatment_updates/show", type: :view do
  before(:each) do
    assign(:treatment_update, TreatmentUpdate.create!(
      name: "Name",
      status: "Status",
      description: "MyText",
      treatment: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Status/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end
