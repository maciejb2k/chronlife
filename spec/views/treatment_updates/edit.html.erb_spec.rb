require 'rails_helper'

RSpec.describe "treatment_updates/edit", type: :view do
  let(:treatment_update) {
    TreatmentUpdate.create!(
      name: "MyString",
      status: "MyString",
      description: "MyText",
      treatment: nil
    )
  }

  before(:each) do
    assign(:treatment_update, treatment_update)
  end

  it "renders the edit treatment_update form" do
    render

    assert_select "form[action=?][method=?]", treatment_update_path(treatment_update), "post" do

      assert_select "input[name=?]", "treatment_update[name]"

      assert_select "input[name=?]", "treatment_update[status]"

      assert_select "textarea[name=?]", "treatment_update[description]"

      assert_select "input[name=?]", "treatment_update[treatment_id]"
    end
  end
end
