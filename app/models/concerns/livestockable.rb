# frozen_string_literal: true

module Livestockable
  extend ActiveSupport::Concern

  included do
    has_one :livestock, as: :livestockable, touch: true, dependent: :destroy
  end
end
