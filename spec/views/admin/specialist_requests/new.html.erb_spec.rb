require 'rails_helper'

RSpec.describe "admin/specialist_requests/new", type: :view do
  before(:each) do
    assign(:admin_specialist_request, Admin::SpecialistRequest.new())
  end

  it "renders new admin_specialist_request form" do
    render

    assert_select "form[action=?][method=?]", admin_specialist_requests_path, "post" do
    end
  end
end
