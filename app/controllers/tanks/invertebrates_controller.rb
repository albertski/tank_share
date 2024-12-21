# frozen_string_literal: true

module Tanks
  class InvertebratesController < LivestocksBaseController
    before_action :set_new_livestock, only: %i[new]
    before_action :set_create_livestock, only: %i[create]

    private

    def set_new_livestock
      @livestock = @tank.livestocks.invertebrates.new
    end

    def set_create_livestock
      @livestock = @tank.livestocks.new(livestock_params)
      @livestock.livestockable = Livestocks::Invertebrate.new
    end
  end
end
