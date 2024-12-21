module Users
  class FollowsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_user

    def create
      Follow.create(follower: current_user, followed: @user)

      render turbostream
    end

    def destroy
      Follow.find_by(follower: current_user, followed: @user)&.destroy

      render turbostream
    end

    private

    def turbostream
      {
        turbo_stream: [
          turbo_stream.replace('user-follower-counts', follower_counts_partial),
          turbo_stream.replace('user-follow-button', follow_button_partial)
        ]
      }
    end

    def follower_counts_partial
      render_to_string(partial: 'users/follows/follower_counts', locals: { user: @user.reload })
    end

    def follow_button_partial
      render_to_string(partial: 'users/follows/follow_button', locals: { user: @user.reload })
    end

    def set_user
      @user = User.find(params[:user_id])
    end
  end
end
