# frozen_string_literal: true

module Tanks
  class EquipmentsBaseController < ApplicationController
    before_action :authenticate_user!
    before_action :set_tank
    before_action :set_equipment, only: %i[edit update destroy]

    def create
      if @equipment.save
        respond_to do |format|
          format.turbo_stream do
            render turbo_stream: [
              turbo_stream.append(@equipment.type.pluralize, partial: 'tanks/equipments/equipment',
                                                             locals: { equipment: @equipment,
                                                                       include_manage_buttons: true }),
              turbo_stream.update(
                @tank.equipment.new(equipmentable: @equipment.equipmentable_type.constantize.new).turbo_frame_tag, ''
              )
            ]
          end
          format.html { redirect_to tank_equipments_path(@tank), notice: 'Equipment was successfully created.' }
        end
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      if @equipment.update(equipment_params)
        redirect_to tank_equipments_path(@tank), notice: 'Equipment was successfully updated.'
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @equipment.destroy

      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.remove(@equipment.turbo_frame_tag) }
        format.html { redirect_to tank_equipments_path(@tank), notice: 'Equipment was successfully destroyed.' }
      end
    end

    private

    def set_tank
      @tank = Tank.find(params[:tank_id])
    end

    def equipment_params
      permitted_params = params[:equipment] ? params.require(:equipment) : params
      permitted_params.permit(:manufacturer, :title, :model, :quantity, :image).merge(tank_id: params[:tank_id])
    end

    def set_equipment
      @equipment = Equipment.find(params[:id])
    end
  end
end
