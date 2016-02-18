class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

   helper_method :current_user

  before_action :ensure_current_user, only: [:new, :create, :update, :destroy]

  def current_user
    owner = Owner.find_by(id: session[:owner_id]) if session[:owner_id]
    developer = Developer.find_by(id: session[:developer_id]) if session[:developer_id]
  end

  def ensure_current_user
    redirect_to new_session_path unless current_user
  end
end
