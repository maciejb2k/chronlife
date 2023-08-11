require 'rails_helper'

RSpec.describe "groups/edit", type: :view do
  let(:group) {
    Group.create!()
  }

  before(:each) do
    assign(:group, group)
  end

  it "renders the edit group form" do
    render

    assert_select "form[action=?][method=?]", group_path(group), "post" do
    end
  end
end
