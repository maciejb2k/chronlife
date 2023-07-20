require 'rails_helper'

RSpec.describe "treatments/edit", type: :view do
  let(:treatment) {
    Treatment.create!(
      title: "MyString",
      description: "MyText",
      effectiveness: 1
    )
  }

  before(:each) do
    assign(:treatment, treatment)
  end

  it "renders the edit treatment form" do
    render

    assert_select "form[action=?][method=?]", treatment_path(treatment), "post" do

      assert_select "input[name=?]", "treatment[title]"

      assert_select "textarea[name=?]", "treatment[description]"

      assert_select "input[name=?]", "treatment[effectiveness]"
    end
  end
end
