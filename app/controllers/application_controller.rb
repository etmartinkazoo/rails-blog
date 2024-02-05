class ApplicationController < ActionController::Base
  helper_method :current_user
  before_action :require_login
  include Pundit::Authorization
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def current_user
    @current_user ||= session[:user_id] && User.find_by(id: session[:user_id])
  end

  def require_login
    unless current_user
      flash[:error] = "You must be logged in to access this section"
      redirect_to new_session_url # replace with your login route
    end
  end

  private
  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_back(fallback_location: todos_path)
  end
end
