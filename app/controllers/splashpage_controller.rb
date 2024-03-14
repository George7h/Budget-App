class SplashpageController < ApplicationController
  def splash
    return unless user_signed_in?

    redirect_to groups_path
  end
end
