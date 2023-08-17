require 'rails_helper'

RSpec.describe "admin/specialist_requests/show", type: :view do
  before(:each) do
    assign(:admin_specialist_request, Admin::SpecialistRequest.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
