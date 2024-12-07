# frozen_string_literal: true

class Tank < ApplicationRecord
  has_many_attached :images
  belongs_to :user
  has_many :tank_parameters
  has_many :equipment

  measured Measured::Volume, :total_volume
  measured Measured::Volume, :display_volume
  measured Measured::Volume, :sub_volume
  measured Measured::Length, :glass_thickness

  validates :name, :description, presence: true

  def update_with_attachments(params)
    # Attach new images
    images.attach(params[:images]) if params[:images].present?

    # Purge images not in `image_ids`
    if params[:image_ids].present?
      images.each do |image|
        image.purge unless params[:image_ids].include?(image.id.to_s)
      end
    end

    # Update other attributes
    update(params.except(:images, :image_ids))
  end
end
