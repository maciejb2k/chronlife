require 'rails_helper'

RSpec.describe "measurements/show", type: :view do
  before(:each) do
    assign(:measurement, Measurement.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
