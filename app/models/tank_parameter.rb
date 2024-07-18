class TankParameter < ApplicationRecord
  belongs_to :tank

  validates :date, uniqueness: { scope: :tank_id, message: 'only one parameter per day is allowed' }
end
