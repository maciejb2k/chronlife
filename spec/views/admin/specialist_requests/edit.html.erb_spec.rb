require 'rails_helper'

RSpec.describe "admin/specialist_requests/edit", type: :view do
  let(:admin_specialist_request) {
    Admin::SpecialistRequest.create!()
  }

  before(:each) do
    assign(:admin_specialist_request, admin_specialist_request)
  end

  it "renders the edit admin_specialist_request form" do
    render

    assert_select "form[action=?][method=?]", admin_specialist_request_path(admin_specialist_request), "post" do
    end
  end
end
