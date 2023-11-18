# frozen_string_literal: true

require 'rails_helper'
require Rails.root.join 'spec/models/concerns/completable_spec.rb'

RSpec.describe User, type: :model do
  it_behaves_like 'completable'
end
