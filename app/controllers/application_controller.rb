class ApplicationController < ActionController::Base
  allow_browser versions: :modern

  before_action :authenticate

  def authenticate
    return redirect_to login_url if session[:user_id].nil?

    @user = User.find(session[:user_id])

    redirect_to login_url if @user.nil?
  rescue ActiveRecord::RecordNotFound
    redirect_to login_url
  end
end
