require 'rails_helper'

RSpec.describe "devices/index", type: :view do
  before(:each) do
    assign(:devices, [
      Device.create!(
        name: "Name",
        status: "Status"
      ),
      Device.create!(
        name: "Name",
        status: "Status"
      )
    ])
  end

  it "renders a list of devices" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Status".to_s), count: 2
  end
end
