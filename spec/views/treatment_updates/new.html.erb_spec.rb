require 'rails_helper'

RSpec.describe "treatment_updates/new", type: :view do
  before(:each) do
    assign(:treatment_update, TreatmentUpdate.new(
      name: "MyString",
      status: "MyString",
      description: "MyText",
      treatment: nil
    ))
  end

  it "renders new treatment_update form" do
    render

    assert_select "form[action=?][method=?]", treatment_updates_path, "post" do

      assert_select "input[name=?]", "treatment_update[name]"

      assert_select "input[name=?]", "treatment_update[status]"

      assert_select "textarea[name=?]", "treatment_update[description]"

      assert_select "input[name=?]", "treatment_update[treatment_id]"
    end
  end
end
