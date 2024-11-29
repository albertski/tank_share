# frozen_string_literal: true

module Tanks
  class HeatersController < EquipmentsBaseController
    before_action :set_new_equipment, only: %i[new]
    before_action :set_create_equipment, only: %i[create]

    private

    def set_new_equipment
      @equipment = @tank.equipment.heaters.new
    end

    def set_create_equipment
      @equipment = @tank.equipment.new(equipment_params)
      @equipment.equipmentable = Equipments::Heater.new
    end
  end
end
