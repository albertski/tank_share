module Livestocks
  class Coral < ApplicationRecord
    include Livestockable

    enum coral_type: {
      lps: 0,                # Large Polyp Stony
      sps: 1,                # Small Polyp Stony
      soft: 2,               # Soft Corals
      nps: 3,                # Non-Photosynthetic Corals
      mushroom: 4,           # Mushroom Corals
      gorgonian: 5,          # Gorgonians
      encrusting: 6,         # Encrusting Corals
      zoanthid: 7,           # Zoanthids
      leather: 8,            # Leather Corals
      plate: 9,              # Plate Corals
      branching: 10,         # Branching Corals
      foliose: 11,           # Foliose Corals
      massive: 12,           # Massive Corals
      free_living: 13        # Free-Living Corals
    }
  end
end
