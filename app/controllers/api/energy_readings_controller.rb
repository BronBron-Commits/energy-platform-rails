class Api::EnergyReadingsController < ActionController::API
  def index
    readings = EnergyReading.all.order(recorded_at: :desc)
    render json: readings
  end

  def create
    reading = EnergyReading.new(reading_params)

    if reading.save
      ProcessEnergyReadingJob.perform_later(reading.id)
      render json: reading, status: :created
    else
      render json: { errors: reading.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def reading_params
    params.require(:energy_reading).permit(:device_id, :kwh, :recorded_at)
  end
end
