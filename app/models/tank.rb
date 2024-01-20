# frozen_string_literal: true

class Tank < ApplicationRecord
  has_many_attached :images
  measured_volume :total_volume, :display_volume, :sub_volume_value, unit_field_name: :volume_unit
  measured_length :glass_thickness, unit_field_name: :size_unit
end
