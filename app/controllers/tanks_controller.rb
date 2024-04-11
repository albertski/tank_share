# frozen_string_literal: true

class TanksController < ApplicationController
  def create
    @tank = Tank.new(tank_params)
    if @tank.save
      redirect_to @tank, notice: 'Tank was successfully created.'
    else
      render :new
    end
  end

  private

  def tank_params
    params.permit(:name, :description, :total_volume_value, :total_volume_unit, :display_volume_value,
                  :display_volume_unit, :sub_volume_value, :sub_volume_unit, :glass_thickness_value,
                  :glass_thickness_unit, images: [])
  end
end
