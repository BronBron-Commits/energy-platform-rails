class ProcessEnergyReadingJob < ApplicationJob
  queue_as :default

  def perform(energy_reading_id)
    reading = EnergyReading.find(energy_reading_id)

    Rails.logger.info "Processing reading #{reading.id} (#{reading.kwh} kWh)"

    # Example logic (expand later)
    if reading.kwh > 100
      Rails.logger.warn "High energy usage detected for device #{reading.device_id}"
    end
  end
end
