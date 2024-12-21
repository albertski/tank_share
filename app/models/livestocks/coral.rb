module Livestocks
  class Coral < ApplicationRecord
    include Livestockable

    enum coral_type: {
      brain_coral: 0,
      staghorn_coral: 1,
      elkhorn_coral: 2,
      fan_coral: 3,
      mushroom_coral: 4,
      plate_coral: 5,
      leather_coral: 6,
      star_coral: 7,
      flower_coral: 8,
      pillar_coral: 9
    }
  end
end
