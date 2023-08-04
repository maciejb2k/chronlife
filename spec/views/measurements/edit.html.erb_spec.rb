require 'rails_helper'

RSpec.describe "measurements/edit", type: :view do
  let(:measurement) {
    Measurement.create!()
  }

  before(:each) do
    assign(:measurement, measurement)
  end

  it "renders the edit measurement form" do
    render

    assert_select "form[action=?][method=?]", measurement_path(measurement), "post" do
    end
  end
end
