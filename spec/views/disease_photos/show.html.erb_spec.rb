require 'rails_helper'

RSpec.describe "disease_photos/show", type: :view do
  before(:each) do
    assign(:disease_photo, DiseasePhoto.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
