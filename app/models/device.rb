class Device < ApplicationRecord
  has_many :energy_readings, dependent: :destroy

  validates :name, presence: true
end
