require 'rails_helper'

RSpec.describe "devices/edit", type: :view do
  let(:device) {
    Device.create!(
      name: "MyString",
      status: "MyString"
    )
  }

  before(:each) do
    assign(:device, device)
  end

  it "renders the edit device form" do
    render

    assert_select "form[action=?][method=?]", device_path(device), "post" do

      assert_select "input[name=?]", "device[name]"

      assert_select "input[name=?]", "device[status]"
    end
  end
end
