# frozen_string_literal: true

class Tank < ApplicationRecord
  has_many_attached :images

  measured Measured::Volume, :total_volume
  measured Measured::Volume, :display_volume
  measured Measured::Volume, :sub_volume
  measured Measured::Length, :glass_thickness

  after_destroy_commit { broadcast_remove_to 'tanks' }

  validates :name, :description, presence: true
end
