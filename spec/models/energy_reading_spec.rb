require 'rails_helper'

RSpec.describe EnergyReading, type: :model do
  it "is valid with valid attributes" do
    device = Device.create!(name: "Test Device", status: "active")

    reading = EnergyReading.new(
      device: device,
      kwh: 42.5,
      recorded_at: Time.now
    )

    expect(reading).to be_valid
  end

  it "is invalid without kwh" do
    device = Device.create!(name: "Test Device", status: "active")

    reading = EnergyReading.new(
      device: device,
      recorded_at: Time.now
    )

    expect(reading).not_to be_valid
  end
end
