require 'rails_helper'

RSpec.describe Device, type: :model do
  it "is valid with a name" do
    device = Device.new(name: "Meter 1", status: "active")
    expect(device).to be_valid
  end

  it "is invalid without a name" do
    device = Device.new(name: nil)
    expect(device).not_to be_valid
  end
end
