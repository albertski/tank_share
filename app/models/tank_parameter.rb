class TankParameter < ApplicationRecord
  belongs_to :tank

  scope :latest, -> { order(date: :desc).limit(1) }

  validates :date, uniqueness: { scope: :tank_id, message: 'only one parameter per day is allowed' }

  TYPES = {
    ph: { name: 'pH', metric: 'pH' },
    temp: { name: 'Temperature', metric: 'F' },
    salinity: { name: 'Salinity', metric: 'SG' },
    alkalinity: { name: 'Alkalinity', metric: 'dKH' },
    ammonia: { name: 'Ammonia', metric: 'ppm' },
    nitrite: { name: 'Nitrite', metric: 'ppm' },
    nitrate: { name: 'Nitrate', metric: 'ppm' },
    phosphate: { name: 'Phosphate', metric: 'ppm' },
    calcium: { name: 'Calcium', metric: 'ppm' },
    magnesium: { name: 'Magnesium', metric: 'ppm' }
  }
end
