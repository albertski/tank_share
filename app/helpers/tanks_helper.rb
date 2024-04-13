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
end
