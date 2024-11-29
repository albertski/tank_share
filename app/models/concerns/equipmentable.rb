module Equipmentable
  extend ActiveSupport::Concern

  included do
    has_one :equipment, as: :equipmentable, touch: true, dependent: :destroy
  end
end
