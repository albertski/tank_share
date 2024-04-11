# frozen_string_literal: true

module TanksHelper
  def volume_options
    [
      [ 'Gallons', 'us_gallon'],
      ['Liters', 'l']
    ]
  end

  def thickness_options
    [
      ['Inches', 'in'],
      ['Millimetersillim', 'mm']
    ]
  end
end
