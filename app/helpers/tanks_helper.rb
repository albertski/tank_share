# frozen_string_literal: true

module TanksHelper
  def volume_options
    [
      %w[Gallons us_gallon],
      %w[Liters l]
    ]
  end

  def thickness_options
    [
      %w[Inches in],
      %w[Millimeters mm]
    ]
  end

  def tank_live_stock_form_url(livestock)
    model = livestock.livestockable_type.demodulize.underscore
    suffix = model == 'fish' ? 'index_path' : 'path'

    if livestock.persisted?
      send("tank_#{model}_path", livestock.tank, livestock)
    else
      send("tank_#{model.pluralize}_#{suffix}", livestock.tank, livestock)
    end
  end

  def coral_type_options
    types = Livestocks::Coral.coral_types.map { |key, _| [key.titleize, key] }
    types.unshift(['Select a coral type', nil])
    types
  end
end
