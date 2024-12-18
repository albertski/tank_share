# frozen_string_literal: true

class Users::ProfileController < ApplicationController
  def profile
  end

  def profile_update
    current_user.update(user_params)

    redirect_to users_profile_path
  end

  private

  def user_params
    params.require(:users_profile).permit(User::COMPLETABLE_ATTRIBUTES)
  end
end
