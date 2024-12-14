class UserTanksController < ApplicationController
  before_action :authenticate_user!

  def index
    @tanks = current_user.tanks.order(created_at: :desc)
  end
end
