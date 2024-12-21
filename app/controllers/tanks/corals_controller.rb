# frozen_string_literal: true

module Tanks
  class CoralsController < LivestocksBaseController
    before_action :set_new_livestock, only: %i[new]
    before_action :set_create_livestock, only: %i[create]

    private

    def perform_create_action(livestock)
      livestock.livestockable.update(coral_type: params[:livestock][:coral_type]) if params[:livestock][:coral_type]
    end

    def perform_edit_action(livestock)
      livestock.livestockable.update(coral_type: params[:livestock][:coral_type]) if params[:livestock][:coral_type]
    end

    def set_new_livestock
      @livestock = @tank.livestocks.coral.new
    end

    def set_create_livestock
      @livestock = @tank.livestocks.new(livestock_params)
      @livestock.livestockable = Livestocks::Coral.new
    end
  end
end
