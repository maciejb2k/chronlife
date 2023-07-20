require 'rails_helper'

RSpec.describe "treatments/show", type: :view do
  before(:each) do
    assign(:treatment, Treatment.create!(
      title: "Title",
      description: "MyText",
      effectiveness: 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2/)
  end
end
