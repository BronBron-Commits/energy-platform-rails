class CreateEnergyReadings < ActiveRecord::Migration[7.1]
  def change
    create_table :energy_readings do |t|
      t.references :device, null: false, foreign_key: true
      t.float :kwh
      t.datetime :recorded_at

      t.timestamps
    end
  end
end
