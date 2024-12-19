# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_user

  def update
    current_user.update(user_params)

    redirect_to edit_user_path(current_user), notice: 'User profile was successfully update.'
  end

  private

  def user_params
    params.require(:user).permit(User::COMPLETABLE_ATTRIBUTES)
  end

  def authorize_user
    return if params[:id].to_i == current_user.id

    redirect_to root_path,
                alert: 'You are not authorized to edit this profile.'
  end
end
