# frozen_string_literal: true

module Tanks
  class LivestocksBaseController < ApplicationController
    before_action :authenticate_user!
    before_action :set_tank
    before_action :set_livestock, only: %i[edit update destroy]

    def create
      if @livestock.save
        perform_create_action(@livestock)
        respond_to do |format|
          format.turbo_stream do
            render turbo_stream: [
              turbo_stream.append(@livestock.type.pluralize, partial: 'tanks/livestocks/livestock',
                                                             locals: { livestock: @livestock,
                                                                       include_manage_buttons: true }),
              turbo_stream.update(
                @tank.livestocks.new(livestockable: @livestock.livestockable_type.constantize.new).turbo_frame_tag, ''
              )
            ]
          end
          format.html { redirect_to tank_livestocks_path(@tank), notice: 'Livestock was successfully created.' }
        end
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
    end

    def update
      if @livestock.update(livestock_params)
        perform_update_action(@livestock)
        redirect_to tank_livestocks_path(@tank), notice: 'Livestock was successfully updated.'
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @livestock.destroy

      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.remove(@livestock.turbo_frame_tag) }
        format.html { redirect_to tank_livestocks_path(@tank), notice: 'Livestock was successfully destroyed.' }
      end
    end

    private

    def perform_create_action(livestock)
    end

    def perform_update_action(livestock)
    end

    def set_tank
      @tank = Tank.find(params[:tank_id])
    end

    def livestock_params
      permitted_params = params[:livestock] ? params.require(:livestock) : params
      permitted_params.permit(:name, :purchase_date, :quantity, :image).merge(tank_id: params[:tank_id])
    end

    def set_livestock
      @livestock = Livestock.find(params[:id])
    end
  end
end
