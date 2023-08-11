require 'rails_helper'

RSpec.describe "groups/index", type: :view do
  before(:each) do
    assign(:groups, [
      Group.create!(),
      Group.create!()
    ])
  end

  it "renders a list of groups" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
  end
end
