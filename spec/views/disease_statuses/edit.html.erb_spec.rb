require 'rails_helper'

RSpec.describe "disease_statuses/edit", type: :view do
  let(:disease_status) {
    DiseaseStatus.create!()
  }

  before(:each) do
    assign(:disease_status, disease_status)
  end

  it "renders the edit disease_status form" do
    render

    assert_select "form[action=?][method=?]", disease_status_path(disease_status), "post" do
    end
  end
end
