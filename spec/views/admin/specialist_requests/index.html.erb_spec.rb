require 'rails_helper'

RSpec.describe "admin/specialist_requests/index", type: :view do
  before(:each) do
    assign(:admin_specialist_requests, [
      Admin::SpecialistRequest.create!(),
      Admin::SpecialistRequest.create!()
    ])
  end

  it "renders a list of admin/specialist_requests" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
  end
end
