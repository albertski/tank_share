class UserTanksController < ApplicationController
  before_action :authenticate_user!

  def index
    @user_tanks = current_user.tanks.order(created_at: :desc)
  end
end
