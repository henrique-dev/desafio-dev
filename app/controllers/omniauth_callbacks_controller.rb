class OmniauthCallbacksController < ApplicationController
  skip_before_action :authenticate
  def google_oauth2
    params = request.env["omniauth.auth"]

    CreateUserService.call(params:).with do |success, user|
      if success
        session[:user_id] = user.id

        redirect_to importers_path
      else
        redirect_to login_path
      end
    end
  end

  def failure
    redirect_to login_path
  end
end
