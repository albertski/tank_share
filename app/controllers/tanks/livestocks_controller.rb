# frozen_string_literal: true

module Tanks
  class LivestocksController < LivestocksBaseController
    before_action :authenticate_user!
    before_action :set_tank

    private

    def set_tank
      @tank = Tank.find(params[:tank_id])
    end
  end
end
