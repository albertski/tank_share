# frozen_string_literal: true

require 'rails_helper'
require Rails.root.join 'spec/controllers/concerns/set_current_user_spec.rb'

RSpec.describe ApplicationController, type: :controller do
  it_behaves_like 'a controller that sets the current user'
end
