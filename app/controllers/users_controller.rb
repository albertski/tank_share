# frozen_string_literal: true

class UsersController < ApplicationController
  def update
    current_user.update(user_params)

    redirect_to edit_user_path(current_user), notice: 'User profile was successfully update.'
  end

  private

  def user_params
    params.require(:user).permit(User::COMPLETABLE_ATTRIBUTES)
  end
end
