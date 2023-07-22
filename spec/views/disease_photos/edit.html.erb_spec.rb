require 'rails_helper'

RSpec.describe "disease_photos/edit", type: :view do
  let(:disease_photo) {
    DiseasePhoto.create!()
  }

  before(:each) do
    assign(:disease_photo, disease_photo)
  end

  it "renders the edit disease_photo form" do
    render

    assert_select "form[action=?][method=?]", disease_photo_path(disease_photo), "post" do
    end
  end
end
