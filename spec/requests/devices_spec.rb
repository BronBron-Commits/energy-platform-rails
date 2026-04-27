require 'rails_helper'

RSpec.describe "/devices", type: :request do
  let(:valid_attributes) do
    {
      name: "Meter 1",
      status: "active"
    }
  end

  let(:invalid_attributes) do
    {
      name: nil,
      status: "active"
    }
  end

  describe "GET /index" do
    it "renders a successful response" do
      Device.create! valid_attributes
      get devices_url
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    it "creates a new Device" do
      expect {
        post devices_url, params: { device: valid_attributes }
      }.to change(Device, :count).by(1)
    end

    it "does not create a new Device with invalid data" do
      expect {
        post devices_url, params: { device: invalid_attributes }
      }.not_to change(Device, :count)
    end
  end
end
