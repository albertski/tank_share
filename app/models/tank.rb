# frozen_string_literal: true

class Tank < ApplicationRecord
  has_many_attached :images
  # measured_volume :total_volume_value, unit_field_name: :total_volume_unit
  # measured_volume :display_volume_value, unit_field_name: :display_volume_unit
  # measured_volume :sub_volume_value, unit_field_name: :sub_volume_unit
  # measured_length :glass_thickness, unit_field_name: :glass_thickness_unit

  measured Measured::Volume, :total_volume
  measured Measured::Volume, :display_volume
  measured Measured::Volume, :sub_volume
  measured Measured::Length, :glass_thickness
end
