require 'rails_helper'

RSpec.describe "disease_photos/index", type: :view do
  before(:each) do
    assign(:disease_photos, [
      DiseasePhoto.create!(),
      DiseasePhoto.create!()
    ])
  end

  it "renders a list of disease_photos" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
  end
end
