class Equipment < ApplicationRecord
  has_one_attached :image
  belongs_to :tank

  delegated_type :equipmentable, types: %w[Heater Light Pump]

  scope :heaters, -> { where(equipmentable_type: 'Equipments::Heater') }
  scope :lights, -> { where(equipmentable_type: 'Equipments::Light') }
  scope :pumps, -> { where(equipmentable_type: 'Equipments::Pump') }

  def turbo_frame_tag
    prefix = "equipment_#{type}_"
    suffix = id.present? ? id : 'new'

    "#{prefix}#{suffix}"
  end

  def type
    equipmentable_type.demodulize.underscore
  end
end
