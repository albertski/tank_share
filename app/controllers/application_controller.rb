# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include SetCurrentUser
  include Pagy::Backend

  protected

  def after_sign_in_path_for(resource)
    users_profile_path
  end
end
