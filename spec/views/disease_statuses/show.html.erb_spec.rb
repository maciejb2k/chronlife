require 'rails_helper'

RSpec.describe "disease_statuses/show", type: :view do
  before(:each) do
    assign(:disease_status, DiseaseStatus.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
