# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @latest_tanks = Tank.all.order(created_at: :desc).limit(3)
  end
end
