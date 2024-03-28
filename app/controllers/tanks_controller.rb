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
    params.permit(:name, :description)
  end
end
