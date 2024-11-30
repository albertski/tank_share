# frozen_string_literal: true

module Tanks
  class PumpsController < EquipmentsBaseController
    before_action :set_new_equipment, only: %i[new]
    before_action :set_create_equipment, only: %i[create]

    private

    def set_new_equipment
      @equipment = @tank.equipment.pumps.new
    end

    def set_create_equipment
      @equipment = @tank.equipment.new(equipment_params)
      @equipment.equipmentable = Equipments::Pump.new
    end
  end
end
