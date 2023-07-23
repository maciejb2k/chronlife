require 'rails_helper'

RSpec.describe "disease_statuses/new", type: :view do
  before(:each) do
    assign(:disease_status, DiseaseStatus.new())
  end

  it "renders new disease_status form" do
    render

    assert_select "form[action=?][method=?]", disease_statuses_path, "post" do
    end
  end
end
