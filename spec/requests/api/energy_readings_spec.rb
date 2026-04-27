require 'rails_helper'

RSpec.describe "API::EnergyReadings", type: :request do
  let!(:device) { Device.create!(name: "Test Device", status: "active") }

  describe "GET /api/energy_readings" do
    it "returns http success" do
      get "/api/energy_readings"
      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST /api/energy_readings" do
    it "creates a reading" do
      expect {
        post "/api/energy_readings", params: {
          energy_reading: {
            device_id: device.id,
            kwh: 10.5,
            recorded_at: Time.now
          }
        }
      }.to change(EnergyReading, :count).by(1)

      expect(response).to have_http_status(:created)
    end

    it "fails with invalid data" do
      post "/api/energy_readings", params: {
        energy_reading: {
          device_id: device.id,
          recorded_at: Time.now
        }
      }

      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
