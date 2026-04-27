require 'rails_helper'

RSpec.describe "devices/show", type: :view do
  before(:each) do
    assign(:device, Device.create!(
      name: "Name",
      status: "Status"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Status/)
  end
end
