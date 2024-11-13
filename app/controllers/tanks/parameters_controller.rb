# frozen_string_literal: true

module Tanks
  class ParametersController < ApplicationController
    before_action :set_tank
    before_action :must_be_tank_owner!
    before_action :set_tank_parameter, only: [:destroy]

    def index
      @tank_parameters = @tank.tank_parameters.order(created_at: :desc)
      @new_tank_parameters = @tank.tank_parameters.new
    end

    def create
      @tank_parameters = @tank.tank_parameters.new(parameter_params)

      if @tank_parameters.save
        respond_to do |format|
          format.turbo_stream
        end
      else
        @new_tank_parameters = @tank_parameters
        @tank_parameters = @tank.tank_parameters.order(created_at: :desc)
        render :index, status: :unprocessable_entity
      end
    end

    def destroy
      @tank_parameter.destroy!

      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.remove(@tank_parameter) }
      end
    end

    private

    def parameter_params
      params.require(:tank_parameter).permit(:date, :ph, :temp, :salinity, :alkalinity, :ammonia, :nitrite, :nitrate,
                                             :phosphate, :calcium, :magnesium)
    end

    def set_tank
      @tank = Tank.find(params[:tank_id])
    end

    def set_tank_parameter
      @tank_parameter = TankParameter.find(params[:id])
    end

    def must_be_tank_owner!
      return if @tank.user == Current.user

      head :forbidden
    end
  end
end
