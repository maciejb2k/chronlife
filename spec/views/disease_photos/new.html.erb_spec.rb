require 'rails_helper'

RSpec.describe "disease_photos/new", type: :view do
  before(:each) do
    assign(:disease_photo, DiseasePhoto.new())
  end

  it "renders new disease_photo form" do
    render

    assert_select "form[action=?][method=?]", disease_photos_path, "post" do
    end
  end
end
