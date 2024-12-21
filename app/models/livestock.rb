class Livestock < ApplicationRecord
  has_one_attached :image
  belongs_to :tank

  delegated_type :livestockable, types: %w[Fish Invertebrate Coral]

  scope :fish, -> { where(livestockable_type: 'Livestocks::Fish') }
  scope :invertebrates, -> { where(livestockable_type: 'Livestocks::Invertebrate') }
  scope :coral, -> { where(livestockable_type: 'Livestocks::Coral') }

  def turbo_frame_tag
    prefix = "livestock_#{type}_"
    suffix = id.present? ? id : 'new'

    "#{prefix}#{suffix}"
  end

  def type
    livestockable_type.demodulize.underscore
  end
end
