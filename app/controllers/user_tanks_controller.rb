class UserTanksController < ApplicationController
  before_action :authenticate_user!

  def index
    @user_tanks = current_user.tanks
  end
end
