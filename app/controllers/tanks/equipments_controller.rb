# frozen_string_literal: true

module Tanks
  class EquipmentsController < EquipmentsBaseController
    before_action :set_tank

    private

    def set_tank
      @tank = Tank.find(params[:tank_id])
    end
  end
end
