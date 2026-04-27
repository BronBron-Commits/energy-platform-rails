class EnergyReading < ApplicationRecord
  belongs_to :device

  validates :kwh, presence: true
  validates :recorded_at, presence: true
end
