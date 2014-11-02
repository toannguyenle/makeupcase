class ApplicationController < ActionController::Base
  config.i18n.enforce_available_locales = true
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  # Memoization - only read the first time - look it up
  helper_method :current_user
  def current_user
    @current_user ||= User.where(id: session[:user_id]).first
  end
end
