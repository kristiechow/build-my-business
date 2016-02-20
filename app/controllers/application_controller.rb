class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  helper_method :current_user

  before_action :ensure_current_user, only: [:new, :create, :update, :destroy]

  before_action :set_auth

  def current_user
    user = User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def ensure_current_user
    redirect_to new_session_path unless current_user
  end

  def set_auth
    @auth = session[:omniauth] if session[:omniauth]
  end
end
