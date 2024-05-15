# frozen_string_literal: true

class TanksController < ApplicationController
  before_action :authenticate_user!

  def create
    @tank = Tank.new(tank_params)
    @tank.user_id = Current.user.id
    if @tank.save
      redirect_to user_tanks_path, notice: 'Tank was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def tank_params
    params.permit(:name, :description, :total_volume_value, :total_volume_unit, :display_volume_value,
                  :display_volume_unit, :sub_volume_value, :sub_volume_unit, :glass_thickness_value,
                  :glass_thickness_unit, images: [])
  end
end
