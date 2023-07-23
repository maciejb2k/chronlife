require 'rails_helper'

RSpec.describe "disease_statuses/index", type: :view do
  before(:each) do
    assign(:disease_statuses, [
      DiseaseStatus.create!(),
      DiseaseStatus.create!()
    ])
  end

  it "renders a list of disease_statuses" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
  end
end
