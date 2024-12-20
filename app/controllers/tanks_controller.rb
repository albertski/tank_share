# frozen_string_literal: true

class TanksController < ApplicationController
  before_action :authenticate_user!, except: %i[show index]
  before_action :set_tank, only: %i[show destroy edit update]

  def index
    @pagy, @tanks = pagy(Tank.all.order(created_at: :desc), items: 12)

    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end

  def show
    @latest_parameters = @tank.tank_parameters.latest.first
  end

  def new
    @tank = Tank.new
  end

  def create
    @tank = Tank.new(tank_params)
    @tank.user_id = Current.user.id
    if @tank.save
      redirect_to user_tanks_path, notice: 'Tank was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @tank.destroy
    respond_to do |format|
      format.html { redirect_to user_tanks_path, notice: 'Tank was successfully destroyed.' }
      format.turbo_stream { render turbo_stream: turbo_stream.remove(@tank) }
    end
  end

  def update
    if @tank.update_with_attachments(tank_params)
      respond_to do |format|
        format.html { redirect_to edit_tank_path(@tank), notice: 'Tank was successfully updated.' }
      end
    else
      render :edit
    end
  end

  def remove_image
    @image = ActiveStorage::Attachment.find(params[:image_id])
    @image.purge_later
    respond_to do |format|
      format.html { redirect_back(fallback_location: request.referrer) }
      format.turbo_stream { render turbo_stream: turbo_stream.remove("image-#{@image.id}") }
    end
  end

  private

  def set_tank
    @tank = Tank.find(params[:id])
  end

  def tank_params
    params.require(:tank).permit(:name, :description, :total_volume_value, :total_volume_unit, :display_volume_value,
                                 :display_volume_unit, :sub_volume_value, :sub_volume_unit, :glass_thickness_value,
                                 :glass_thickness_unit, images: [], image_ids: []).tap do |permitted|
      permitted[:images]&.reject!(&:blank?)
    end
  end
end
