class SessionsController < ApplicationController
  layout 'session'

  skip_before_action :authenticate

  def login; end

  def logout
    session[:user_id] = nil

    render :login
  end
end
